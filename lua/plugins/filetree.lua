-- File tree sidebar via nvim-tree.
-- Icons are plain unicode arrows so it renders without a Nerd Font.
return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    -- `nvim <folder>`: load the tree at startup so it takes over the directory
    -- buffer (netrw is disabled in config/lazy.lua)
    init = function()
      if vim.fn.argc(-1) == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
        require("nvim-tree")
      end
    end,
    keys = {
      { "<leader>n", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle file tree" },
    },
    opts = {
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)

        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = bufnr, nowait = true, desc = "nvim-tree: " .. desc })
        end
        -- l only unfolds a closed folder (Enter opens files); h folds the open folder,
        -- or the one containing the cursor when on a file / closed folder
        map("l", function()
          local node = api.tree.get_node_under_cursor()
          if node and node.type == "directory" and not node.open then
            api.node.open.edit()
          end
        end, "Unfold")
        map("h", function()
          local node = api.tree.get_node_under_cursor()
          if not (node and node.type == "directory" and node.open) then
            api.node.navigate.parent()
          end
          -- collapse is recursive, so subfolders are folded too
          api.node.collapse()
        end, "Fold")
      end,
      view = { width = 35 },
      -- hide the tree once a file is opened from it
      actions = { open_file = { quit_on_open = true } },
      -- keep the tree pointed at the current file as you switch buffers
      update_focused_file = { enable = true },
      renderer = {
        icons = {
          show = { file = false, folder = false, folder_arrow = true, git = false },
          glyphs = { folder = { arrow_closed = "▸", arrow_open = "▾" } },
        },
      },
      filters = { dotfiles = false, custom = { "^.git$", "node_modules" } },
    },
  },
}
