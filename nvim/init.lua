vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.clipboard = "unnamedplus" -- system clipboard
vim.opt.wrap = true

function RestoreCursorPosition()
  local line = vim.fn.line("'\"")
  if line > 1 and line <= vim.fn.line("$") and vim.bo.filetype ~= 'commit' and vim.fn.index({'xxd', 'gitrebase'}, vim.bo.filetype) == -1 then
    vim.cmd('normal! g`"')
  end
end

if vim.fn.has("autocmd") then
  vim.cmd([[
    autocmd BufReadPost * lua RestoreCursorPosition()
  ]])
end
