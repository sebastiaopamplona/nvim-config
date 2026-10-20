-- Language servers.
-- nvim-lspconfig only ships server definitions (cmd, filetypes, root markers);
-- Neovim's built-in vim.lsp.enable() does the rest.
-- mason installs the server binaries into ~/.local/share/nvim/mason.

-- Add a language: append its lspconfig name here (see :help lspconfig-all).
local servers = { "gopls", "ts_ls", "yamlls", "jsonls" }

-- NOTE: yaml-language-server is pinned to 1.25.0 (installed via `:MasonInstall yaml-language-server@1.25.0`)
-- because 2.x needs Node >= 22.13. Don't update it from :Mason until your default Node is upgraded.

-- Already on PATH, so mason doesn't need to install it
local system_installed = { gopls = true }

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_filter(function(s) return not system_installed[s] end, servers),
        automatic_enable = false, -- enabled explicitly below, including system-installed servers
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = false,
            staticcheck = true,
            usePlaceholders = false,
            analyses = { unusedparams = true },
          },
        },
      })

      vim.lsp.enable(servers)

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded" },
      })

      -- Neovim already provides these defaults:
      --   grn rename · gra code action · grr references · gri implementation
      --   grt type definition · gO document symbols · ]d / [d next/prev diagnostic
      -- K is hover by default, but K is remapped in keymaps.lua, so hover lives on gh.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gh", vim.lsp.buf.hover, "Hover docs")
          map("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
          map("<leader>F", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
        end,
      })

      -- Format + organize imports on save for Go
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function(ev)
          local params = vim.lsp.util.make_range_params(0, "utf-16")
          params.context = { only = { "source.organizeImports" } }
          local res = vim.lsp.buf_request_sync(ev.buf, "textDocument/codeAction", params, 1000)
          for cid, r in pairs(res or {}) do
            for _, action in pairs(r.result or {}) do
              if action.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(action.edit, enc)
              end
            end
          end
          vim.lsp.buf.format({ bufnr = ev.buf, timeout_ms = 1000 })
        end,
      })
    end,
  },
}
