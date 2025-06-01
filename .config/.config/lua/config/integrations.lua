-- Fix yaml indentation issues when commenting
-- on remote vims you can just use set indentkeys-=0#
vim.cmd([[autocmd FileType yaml,yml setlocal indentkeys-=0#]])
-- start jsons in folded mode, fold everything that is mroe than foldminlines
vim.cmd([[autocmd FileType json setlocal foldminlines=4 | execute "normal! zM" ]])

-- a function that either toggles if you're inside a fold or just sends a CR if no fold
_G.folding = {}
function _G.folding.toggle_or_return()
  if vim.fn.foldlevel(".") > 0 then
    vim.cmd("normal! za")
  else
    vim.api.nvim_feedkeys("<CR>", "n", true)
  end
end

-- Set the key mappings
local noremap_silent = { noremap = true, silent = true }
-- use the key to the left of the 1 in spanish keyboards to toggle line numbers
vim.api.nvim_set_keymap("n", "º", ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', noremap_silent)
-- use return in normal mode to toggle folds
vim.api.nvim_set_keymap("n", "<CR>", ":lua _G.folding.toggle_or_return()<CR>", noremap_silent)
