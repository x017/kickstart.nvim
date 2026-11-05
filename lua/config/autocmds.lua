-- lua/config/autocmds.lua
-- All global autocmds in one place.

-- Breadcrumbs: current function/class path at the top of the window (nvim-navic)
vim.o.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
vim.api.nvim_set_hl(0, 'WinBar', { fg = '#9aa3ad', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = '#636e7b', bg = 'NONE' })

-- Highlight yanked (copied) text briefly
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('config-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
