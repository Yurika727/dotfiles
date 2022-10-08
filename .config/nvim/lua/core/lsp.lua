local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Lsp config server
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Lsp borders
local border = {
    {"╭", "FloatBorder"},
    {"─", "FloatBorder"},
    {"╮", "FloatBorder"},
    {"│", "FloatBorder"},
    {"╯", "FloatBorder"},
    {"─", "FloatBorder"},
    {"╰", "FloatBorder"},
    {"│", "FloatBorder"},
}

-- To instead border override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Change diagnostic symbols in the sign column (gutter)
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Change diagnostic virtual text
-- vim.cmd [[
--     highlight DiagnosticVirtualTextError guibg=none
--     highlight DiagnosticVirtualTextWarn guibg=none
--     highlight DiagnosticVirtualTextHint guibg=none
--     highlight DiagnosticVirtualTextInfo guibg=none
-- ]]

-- Use an on_attach function to only map the following keys
local wk = require('which-key')

local wk_opts_normal = {
    mode = 'n',
    prefix = '<leader>',
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
    buffer = bufnr
}

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        require('nvim-navic').attach(client, bufnr)
    end

    wk.register({
        l = {
            name = 'LSP',
            g = {
                name = 'LSP Go To',
                D = { vim.lsp.buf.declaration, 'LSP Go To Declaration' },
                d = { vim.lsp.buf.definition, 'LSP Go To Definition' },
                i = { vim.lsp.buf.implementation, 'LSP Go To Implementation' },
                r = { vim.lsp.buf.references, 'LSP Go To References' },
            },
            D = { vim.lsp.buf.type_definition, 'LSP Go To Type Definition' },
            e = { vim.diagnostic.open_float, 'LSP Open Float Diagnostic' },
            q = { vim.diagnostic.setloclist, 'LSP Open List Diagnostic' },
            a = { vim.lsp.buf.code_action, 'LSP Code Action' },
            r = { vim.lsp.buf.rename, 'LSP Rename' },
            f = { vim.lsp.buf.formatting, 'LSP Formatting' },
            h = { vim.lsp.buf.signature_help, 'LSP Signature Help' },
            k = { vim.lsp.buf.hover, 'LSP Hover' },
            s = { ':SymbolsOutline<CR>', 'LSP Symbols Outline' },

        },
    }, wk_opts_normal)
end

-- List server
local servers = {
    'tsserver',
    'eslint',
    'tailwindcss',
    'html',
    'cssls',
    'emmet_ls',
    'jsonls',
    'clangd'
}

-- Start config lsp server
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    }
end

-- Fix omnisharp `textDocument/definition`
require('lspconfig')['omnisharp'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    handlers = {
        ['textDocument/definition'] = require('omnisharp_extended').handler,
    }
}

-- Customizing how diagnostics are displayed
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

vim.diagnostic.config({
    virtual_text = {
        source = 'always',
        prefix = '●', -- Could be '●', '▎', 'x'
    },
    float = {
        source = 'always',
    },
})
