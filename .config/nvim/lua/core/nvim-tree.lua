require('nvim-tree').setup {
    view = {
        mappings = {
            list = {
                { key = '?', action = 'toggle_help' },
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
    diagnostics = {
        enable = true,
    }
}
