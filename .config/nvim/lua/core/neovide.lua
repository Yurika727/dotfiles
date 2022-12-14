vim.g.gui_font_default_size = 11
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Iosevka"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymap

local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
vim.keymap.set("v", "<S-C-c>", "\"+y")
vim.keymap.set("n", "<S-C-v>", "\"+p")
-- Cursor
vim.g.neovide_cursor_animation_length=0.13
vim.g.neovide_cursor_vfx_mode = "railgun"
