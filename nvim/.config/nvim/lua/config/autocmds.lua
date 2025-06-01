-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
--
-- Fix yaml indentation issues when commenting
-- on remote vims you can just use set indentkeys-=0#
vim.cmd([[autocmd FileType yaml,yml setlocal indentkeys-=0#]])
-- start jsons in folded mode, fold everything that is mroe than foldminlines
vim.cmd([[autocmd FileType json setlocal foldminlines=4 | execute "normal! zM" ]])
