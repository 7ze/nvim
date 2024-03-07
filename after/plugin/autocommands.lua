-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanked text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- disable diagnostics for .env files
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '.env',
  group = vim.api.nvim_create_augroup('__env', { clear = true }),
  callback = function(args)
    vim.diagnostic.disable(args.buf)
  end,
})

-- detect ansible filetypes
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile', 'BufEnter' }, {
  desc = 'Detect Ansible filetypes',
  group = vim.api.nvim_create_augroup('Ansible', { clear = true }),
  pattern = {
    '*/roles/*/*/*.yaml',
    '*/roles/*/*/.yml',
    'main.yml',
    'main.yaml',
    'local.yml',
    'local.yaml',
    'tasks/*.yaml',
    'tasks/*.yml',
  },
  callback = function()
    vim.opt.filetype = 'yaml.ansible'
  end,
})
