local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove highlights
keymap("n", "<ESC>", ":nohlsearch<CR>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- Save file
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
keymap("v", "<C-s>", "<ESC>:w<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffer
keymap("n", "<C-w>", ":Bdelete<CR>", opts)

-- Move text up and down
keymap("n", "<C-j>", ":m .+1<CR>", opts)
keymap("n", "<C-k>", ":m .-2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-j>", ":m .+1<CR>", opts)
keymap("v", "<C-k>", ":m .-2<CR>", opts)

-- Replace text without yanking the deleted text
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

keymap("n", "C-v", "p", opts)
keymap("i", "C-v", "p", opts)
keymap("v", "C-v", "p", opts)
