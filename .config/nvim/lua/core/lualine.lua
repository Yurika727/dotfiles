local colors = require("tokyonight.colors").setup()

local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
            normal = {
                a = { fg = colors.fg, bg = colors.bg_dark },
                x = { fg = colors.fg, bg = colors.bg_dark },
            },
            inactive = {
                a = { fg = colors.fg, bg = colors.bg_dark },
                x = { fg = colors.fg, bg = colors.bg_dark },
            },
        },
        ignore_focus = {
            'NvimTree',
            'packer',
            'toggleterm',
            'dapui_scopes',
            'dapui_stacks',
            'dapui_breakpoints',
            'dapui_watches',
            'dapui_console',
            'dap-repl',
            'Trouble',
            'Outline',
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}

local function ins_left(component)
    table.
 insert(config.sections.lualine_a, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

-- Focus
ins_left {
    function()
        return '▊'
    end,
    color = { fg = colors.blue },
    padding = { right = 1 },
}

ins_left {
  -- mode component
  function()
    return '󰊠'
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
    'filename',
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_left {
    'filesize',
}

ins_left {
    'diagnostics',
    sources = { 'nvim_lsp' },
    sections = { 'error', 'warn', 'info', 'hint' },
    diagnostics_color = {
        error = { fg = colors.red },
        warn  = { fg = colors.yellow },
        info  = { fg = colors.cyan },
        hint  = { fg = colors.green },
    },
    symbols = { error = ' ', warn = ' ', info = ' ', hint = ' '},
}

ins_left {
    function()
        return '%='
    end,
}

ins_left {
  -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = colors.blue, gui = 'bold' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_right {
    'diff',
    diff_color = {
        added    = { fg = colors.green },
        modified = { fg = colors.orange },
        removed  = { fg = colors.red },
    },
    symbols = { added = ' ', modified = '柳', removed = ' ' },
}

ins_right {
    'fileformat',
}

ins_right {
    'filetype',
}

ins_right {
    'progress',
    color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
    'location',
    color = { fg = colors.fg, gui = 'bold' },
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

require('lualine').setup(config)
