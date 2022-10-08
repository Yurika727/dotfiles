require('toggleterm').setup {
    open_mapping = '<C-t>',
    -- Transparent terminal
    highlights = {
        Normal = {
            link = 'Normal',
        },
        NormalFloat = {
            link = 'NormalFloat',
        },
        FloatBorder = {
            link = 'FloatBorder',
        },
    },
    start_in_insert = false,
}

vim.cmd[[
    autocmd TermOpen * setlocal signcolumn=no
    autocmd TermOpen * setlocal nocursorline
]]
