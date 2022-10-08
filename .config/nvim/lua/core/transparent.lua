require('transparent').setup({
    enable = false,
    extra_groups = {
        'NvimTreeNormal', -- nvim-tree bg
        'NvimTreeNormalNC',
        'TelescopeNormal', -- telescope bg
        'TelescopeNormalNC',
        'TelescopeBorder',
        'NormalFloat', -- float bg
        'FloatBorder',
        'TroubleNormal',
        'MsgArea', -- msg mode command bg
        'WhichKey',
        'WhichKeyFloat',
        'WhichKeyBorder',
    }
})

vim.cmd[[
    highlight TelescopeNormal guibg=NONE ctermbg=NONE
    highlight TelescopeBorder guibg=NONE ctermbg=NONE
    highlight NormalFloat guibg=NONE ctermbg=NONE
    highlight FloatBorder guibg=NONE ctermbg=NONE
    highlight WhichKeyNormal guibg=NONE ctermbg=NONE
    highlight WhichKeyFloat guibg=NONE ctermbg=NONE
]]
