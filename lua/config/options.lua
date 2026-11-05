-- lua/config/options.lua
-- All global vim options in one place.

-- Leader keys (must be set before any keymaps load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ── UI ──────────────────────────────────────────────
vim.o.termguicolors = true
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.cursorline = false -- keep the buffer highlight disabled (was a VimEnter autocmd before)
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.opt.fillchars = { eob = ' ' }
vim.o.breakindent = true
vim.o.scrolloff = 10

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = 'split'
vim.o.confirm = true

-- ── Files ───────────────────────────────────────────
vim.o.undofile = true
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- ── Search ──────────────────────────────────────────
vim.o.ignorecase = true
vim.o.smartcase = true

-- ── Timing ──────────────────────────────────────────
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- ── Indentation ─────────────────────────────────────
vim.opt.tabstop = 4 -- visual spaces per TAB
vim.opt.shiftwidth = 4 -- spaces per indentation level
vim.opt.softtabstop = 4 -- backspace behaves like 4 spaces
vim.opt.expandtab = true -- use spaces instead of tabs
