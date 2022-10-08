require('nvim-treesitter.configs').setup{
    ensure_installed = {
        'c',
        'bash',
        'c_sharp',
        'css',
        'scss',
        'comment',
        'html',
        'javascript',
        'tsx',
        'typescript',
        'json',
        'lua',
        'markdown'
    },
    highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
    }
}
