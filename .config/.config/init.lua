-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.integrations")
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
