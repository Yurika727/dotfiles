local dap = require('dap')
local dap_install = require('dap-install')

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticSignWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticSignInfo', linehl = 'DiagnosticSignInfo', numhl = 'DiagnosticSignInfo' })

dap_install.setup()
dap_install.config('dnetcs', {})
