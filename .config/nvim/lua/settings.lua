-- Setting base
vim.opt.syntax = 'on'

-- Usage mouse
vim.opt.mouse = 'a'

-- Spell check
-- vim.opt.spell = true

-- Fix cmd complete
vim.cmd[[
    set wildcharm=<C-z>
]]

-- Folding
vim.opt.foldmethod = 'manual'
vim.cmd[[
    augroup folds
        autocmd!
        autocmd BufWinLeave ?* mkview
        autocmd BufWinEnter ?* silent! loadview
    augroup END
]]

-- Set mapping leader
vim.g.mapleader = ' '

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.backspace = 'start,eol,indent'

vim.cmd[[
    autocmd Filetype cs setlocal ts=4 sw=4
    autocmd Filetype lua setlocal ts=4 sw=4
    autocmd Filetype markdown setlocal ts=4 sw=4
    autocmd Filetype vim setlocal ts=4 sw=4
]]

vim.opt.laststatus = 2

vim.opt.cursorline = true

vim.opt.number = true
vim.opt.ruler = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.completeopt = 'menu,menuone,noselect'

vim.opt.signcolumn = 'yes'

vim.opt.clipboard = 'unnamed,unnamedplus'

-- Auto trim space
vim.cmd[[
    autocmd BufWritePre *.* %s/\s\+$//e
]]

-- fix undercurl
vim.cmd[[
    let &t_Cs = "\e[4:3m"
    let &t_Ce = "\e[4:0m"
]]

-- enable gui color
vim.opt.termguicolors = true

-- set background
vim.opt.background = 'dark'

-- Disable cursorline
vim.cmd[[
    autocmd Filetype qf setlocal nocursorline wrap
    autocmd Filetype Trouble setlocal nocursorline wrap
    autocmd Filetype dapui_* setlocal nocursorline
    autocmd Filetype dap-repl setlocal nocursorline
]]

-- Syntax cshtml
vim.cmd[[
    autocmd BufNewFile,BufRead *.cshtml set syntax=html
]]
