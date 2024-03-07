return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'awk',
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'go',
        'html',
        'javascript',
        'lua',
        'markdown',
        'ocaml',
        'python',
        'regex',
        'ruby',
        'rust',
        'sql',
        'typescript',
        'vim',
        'vimdoc',
        'zig',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
