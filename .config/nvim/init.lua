require('bootstrap')

require('settings')

require('keymappings')

-- load plugin
require('plugins')

-- Tokyonight
require('core.tokyonight')

-- nvim-tree
require('core.nvim-tree')

-- lsp-installer
require('core.lsp-installer')

-- navic-winbar
require('core.navic')

-- lspconfig
require('core.lsp')

-- Trouble
require('trouble').setup()

-- outline
require('core.outline')

-- Auto Completion
require('core.cmp')

-- luasnip
require('core.luasnip')

-- Treesitter
require('core.treesitter')

-- Gitsigns
require('core.gitsigns')

-- lualine
require('core.lualine')

-- bufferline
require('core.bufferline')

-- Telescope
require('core.telescope')

-- Comment
require('core.comment')
require('core.ts_context_commentstring')
require('core.ts_autotag')
-- neovide
require('core.neovide')
-- Debug
require('core.dap')
require('dapui').setup()

-- Color hex
require('core.colorizer')

-- EasyMotion
require('core.hop')

-- Autopairs
require('core.autopairs')

-- Indent
require('core.indent')

-- Scroll smooth
require('core.neoscroll')

-- Toggle terminal
require('core.toggleterm')

-- Transparent
require('core.transparent')

-- Dashboard/Alpha
require('core.alpha')

-- Automatically highlighting
require('core.illuminate')

-- Format
require('core.formatter')

-- Cache
require('impatient').enable_profile()

-- Ibus
-- require('core.ibus')

-- Which-key
require('core.which-key')

-- Key Mappings Which-key
require('keymappings_wk')
