-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local noremap_silent = { noremap = true, silent = true }
-- use the key to the left of the 1 in spanish keyboards to toggle line numbers
vim.api.nvim_set_keymap("n", "º", ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', noremap_silent)
-- use return in normal mode to toggle folds
vim.api.nvim_set_keymap("n", "<CR>", ":lua _G.folding.toggle_or_return()<CR>", noremap_silent)
