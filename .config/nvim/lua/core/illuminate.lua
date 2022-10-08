require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 100,
    filetypes_denylist = {
        'alpha',
        'NvimTree',
        'packer',
        'Trouble',
        'Outline',
        'toggleterm',
        'TelescopePrompt',
    },
})
