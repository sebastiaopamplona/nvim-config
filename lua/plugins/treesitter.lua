-- Syntax highlighting and indentation via treesitter.
-- Uses the `main` branch (the rewrite for Neovim 0.11+): it only installs parsers,
-- and Neovim's built-in vim.treesitter does the highlighting.
-- Parsers are compiled with the tree-sitter CLI (brew install tree-sitter-cli).

-- Add a language: append its parser name here (see :help nvim-treesitter-languages).
local parsers = {
  "go", "gomod", "gosum", "gowork",
  "typescript", "tsx", "javascript",
  "yaml", "json",
  "lua", "vim", "vimdoc", "markdown", "markdown_inline", "bash",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- the plugin doesn't support lazy-loading
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          -- pcall: skip filetypes that have no installed parser
          if pcall(vim.treesitter.start, ev.buf) then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
