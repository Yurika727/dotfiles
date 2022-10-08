require('nvim-navic').setup {
    highlight = true,
    separator = "  ",
}

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
