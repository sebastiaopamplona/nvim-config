-- VSCode-like row of open buffers at the top via mini.tabline.
-- Picked over bufferline.nvim because it works with termguicolors off (terminal colors).
--
-- Each label is marked with:
--   ▸ name     current buffer
--   name ●     unsaved changes
--   name M     unstaged git changes (U = untracked file)

-- buf_id -> "M" / "U" for files with changes not yet staged in git
local git_marks = {}

-- Ask git about one buffer's file in the background; redraw the tabline when it answers.
local function refresh_git(buf)
  local path = vim.api.nvim_buf_get_name(buf)
  if path == "" or vim.bo[buf].buftype ~= "" then return end
  vim.system(
    { "git", "-C", vim.fs.dirname(path), "status", "--porcelain", "--", path },
    { text = true },
    function(res)
      -- porcelain "XY path": X = staged, Y = unstaged ("?" for untracked)
      local y = res.code == 0 and res.stdout:sub(2, 2) or ""
      local mark = (y == "?" and "U") or (y ~= "" and y ~= " " and "M") or nil
      vim.schedule(function()
        if git_marks[buf] ~= mark then
          git_marks[buf] = mark
          vim.cmd.redrawtabline()
        end
      end)
    end
  )
end

local function refresh_all_git()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted then refresh_git(buf) end
  end
end

return {
  {
    "nvim-mini/mini.tabline",
    event = "VeryLazy",
    keys = {
      { "<leader>l", "<cmd>bnext<cr>", desc = "Next buffer" },
      { "<leader>h", "<cmd>bprevious<cr>", desc = "Previous buffer" },
    },
    opts = {
      show_icons = false, -- icons need a Nerd Font
      format = function(buf, label)
        local prefix = buf == vim.api.nvim_get_current_buf() and "▸ " or "  "
        local suffix = (vim.bo[buf].modified and " ●" or "") .. (git_marks[buf] and " " .. git_marks[buf] or "")
        return prefix .. label .. suffix .. " "
      end,
    },
    config = function(_, opts)
      require("mini.tabline").setup(opts)

      local group = vim.api.nvim_create_augroup("TablineGit", { clear = true })
      -- a file was opened or saved: re-check just that one
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        group = group,
        callback = function(ev) refresh_git(ev.buf) end,
      })
      -- back from another terminal / a :! command (e.g. `git add`): re-check everything
      vim.api.nvim_create_autocmd({ "FocusGained", "ShellCmdPost", "TermLeave" }, {
        group = group,
        callback = refresh_all_git,
      })
      vim.api.nvim_create_autocmd("BufWipeout", {
        group = group,
        callback = function(ev) git_marks[ev.buf] = nil end,
      })
      -- the "●" needs a redraw as soon as the buffer becomes modified / saved
      vim.api.nvim_create_autocmd("BufModifiedSet", {
        group = group,
        callback = function() vim.cmd.redrawtabline() end,
      })

      refresh_all_git() -- buffers opened before the plugin loaded
    end,
  },
}
