local opt = vim.opt

-- Colors: inherit the terminal's palette.
-- With termguicolors off, Neovim uses the terminal's 16 ANSI colors instead of
-- its own 24-bit RGB values, so whatever theme iTerm uses is what you see.
-- The background (dark/light) is auto-detected from the terminal.
opt.termguicolors = false
vim.cmd.colorscheme("default")

-- UI
opt.number = true
opt.cursorline = true
opt.signcolumn = "yes" -- keep space for LSP diagnostics so text doesn't shift
opt.wrap = false
opt.scrolloff = 20
opt.cmdheight = 2
opt.laststatus = 0
opt.showtabline = 2
opt.splitbelow = true
opt.splitright = true
opt.conceallevel = 0
opt.mouse = "a"

-- Editing
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.iskeyword:append("-")
opt.clipboard = "unnamedplus"

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Files
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true

-- Timing
opt.updatetime = 300
opt.timeoutlen = 500

-- Stop newline continuation of comments (ftplugins reset this, so use an autocmd)
vim.api.nvim_create_autocmd("FileType", {
  callback = function() vim.opt_local.formatoptions:remove({ "c", "r", "o" }) end,
})
