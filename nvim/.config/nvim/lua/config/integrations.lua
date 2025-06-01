-- a function that either toggles if you're inside a fold or just sends a CR if no fold
_G.folding = {}
function _G.folding.toggle_or_return()
  if vim.fn.foldlevel(".") > 0 then
    vim.cmd("normal! za")
  else
    vim.api.nvim_feedkeys("<CR>", "n", true)
  end
end
