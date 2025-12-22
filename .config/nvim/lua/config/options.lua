-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Copilot suggestions dont work without this?
vim.g.ai_cmp = false

vim.g.root_spec = { "lsp", { ".git", "lua", "build.sbt" }, "cwd" }
