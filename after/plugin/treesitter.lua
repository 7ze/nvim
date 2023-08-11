require 'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp" , "python", "rust", "ocaml", "go", "bash", "awk", "html", "css", "javascript", "dockerfile", "ruby", "lua", "regex", "sql", "zig"},
    sync_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
