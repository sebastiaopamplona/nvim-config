-- Ported from the old vimscript config.
-- Alt-key characters (ß, æ, ø, ≠) are what iTerm sends for the ⌘ bindings.
local map = vim.keymap.set

-- Save / quit
map({ "n", "i" }, "<C-s>", "<Esc>:wq<CR>")
map({ "n", "i" }, "ß", "<Esc>:w<CR>")

-- Escape
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

-- Movement
map("n", "<S-w>", "b")
map({ "n", "v" }, "<C-k>", "3k")
map({ "n", "v" }, "<C-j>", "3j")

-- Start a visual selection from normal mode with H/J/K/L, and keep extending it
map("n", "H", "<Esc>vh")
map("n", "J", "<Esc>vj")
map("n", "K", "<Esc>vk")
map("n", "L", "<Esc>vl")
map("v", "H", "h")
map("v", "J", "jzz")
map("v", "K", "kzz")
map("v", "L", "l")
map("v", "W", "b")
map("v", "j", "jzz")
map("v", "k", "kzz")

-- Indent selection with Tab
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Search
map("n", "F", "/\\c") -- case-insensitive search
map("n", "ƒ", "/")
map("n", "B", "*N") -- highlight word under cursor
map("n", "≠", ":noh<CR>")

-- Lines
map("n", "X", "dd")

-- Tabs / buffers
map("n", "T", ":tabnew .<CR>")
map("n", "<leader>t", ":tabclose<CR>")
map("n", "<leader>w", ":bd<CR>")

-- Jump list back / forward
map("n", "æ", "<C-o>")
map("n", "ø", "<C-i>")

-- Folds
map("n", "<C-i>", "zc")
map("n", "<C-o>", "zo")
