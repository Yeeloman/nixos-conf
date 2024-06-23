-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = {}
-- source init file
keymap.set("n", "<F2>", ":source ~/.config/nvim/init.lua<CR>", opts)

-- to navigate in insert mode using ctr hjkl
keymap.set("i", "<C-h>", "<C-o>h", opts)
keymap.set("i", "<C-l>", "<C-o>l", opts)
keymap.set("i", "<C-j>", "<C-o>j", opts)
keymap.set("i", "<C-k>", "<C-o>k", opts)

-- pane nav
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)

-- vertical and horizontal split
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>se", ":split<CR>", opts)

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- move selected lines
keymap.set("n", "<A-J>", ":move +1<CR>")
keymap.set("n", "<A-K>", ":move -2<CR>")

-- buffer picker
keymap.set("n", "<leader>ba", ":BufferLinePick<CR>")
keymap.set("i", "<C-b>", "<C-o>:BufferLinePick<CR>")
