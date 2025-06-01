-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.integrations")
require("config.lsp")
-- vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme tokyonight-night]])
require("lazyvim.plugins.lsp")
