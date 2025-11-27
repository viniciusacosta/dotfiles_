-- bootstrap lazy.nvim, LazyVim and your plugins
vim.env.PATH = "/home/vinicius/.nvm/versions/node/v24.11.0/bin:" .. vim.env.PATH
require("config.lazy")
