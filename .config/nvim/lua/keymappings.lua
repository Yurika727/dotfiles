--[[
*******************
* Keymapping Base *
*******************
]]

local opts = { noremap=true, silent=true }
local keymap = vim.keymap.set

keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

keymap('v', 'J', ':m \'>+1<CR>gv=gv', opts)
keymap('v', 'K', ':m \'<-2<CR>gv=gv', opts)

-- Select split window
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Increment/Decrement
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Save
keymap('n', '<C-s>', ':update<CR>', opts)

-- Bufferline
keymap('n', '<A-.>', ':BufferLineCycleNext<CR>', opts) -- bnext
keymap('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts) -- bprevious
keymap('n', '<A->>', ':BufferLineMoveNext<CR>', opts) -- move bnext
keymap('n', '<A-<>', ':BufferLineMovePrev<CR>', opts) -- move bprevious
keymap('n', '<A-c>', ':bdelete<CR>', opts)

-- Nvim-tree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

-- LSP
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)

-- Debug
keymap('n', '<F5>', ':lua require\'dap\'.continue()<CR>', opts)
keymap('n', '<F10>', ':lua require\'dap\'.step_over()<CR>', opts)
keymap('n', '<F11>', ':lua require\'dap\'.step_into()<CR>', opts)
keymap('n', '<F12>', ':lua require\'dap\'.step_out()<CR>', opts)

-- Toggle Terminal
keymap('t', '<C-\\>', '<C-\\><C-n>', opts)
keymap('t', '<C-h>', '<C-w>h', opts)
keymap('t', '<C-j>', '<C-w>j', opts)
keymap('t', '<C-k>', '<C-w>k', opts)
keymap('t', '<C-l>', '<C-w>l', opts)
-- Split terminal for example: 2<C-t> will open terminal 2
keymap('t', '<C-t>', ':exe v:count1 . \'ToggleTerm\'<CR>', opts)

-- Resize window
keymap('n', '<C-Left>', ':vertical resize +2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
