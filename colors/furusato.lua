-- Furusato Neovim Colorscheme
-- Save this file to: ~/.config/nvim/colors/furusato.lua
-- Usage: :colorscheme furusato
--
-- Customization:
-- vim.g.setup = {
--   transparent = true,
--   italic_comments = true,
--   italic_keywords = false,
--   italic_functions = false,
--   italic_variables = false,
-- }

-- Get user config or use defaults
local config = vim.g.setup or {}
local transparent = config.transparent or false
local italic_comments = config.italic_comments ~= false -- default true
local italic_keywords = config.italic_keywords or false
local italic_functions = config.italic_functions or false
local italic_variables = config.italic_variables or false

vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.o.background = 'dark'
vim.g.colors_name = 'furusato'

-- Color palette
local colors = {
  white = '#adbac7',
  black = '#090b0d',
  darker_black = '#07080a',
  black2 = '#0f1114',
  one_bg = '#121417',
  one_bg2 = '#181a1e',
  one_bg3 = '#1e2025',
  grey = '#8a949e',
  grey_fg = '#9aa3ad',
  grey_fg2 = '#aab3bd',
  light_grey = '#b9c2cc',
  red = '#B86A6A',
  baby_pink = '#B86A6A',
  pink = '#7a8db0',
  line = '#181a1e',
  green = '#526d7c',
  vibrant_green = '#526d7c',
  nord_blue = '#64778d',
  blue = '#64778d',
  seablue = '#64778d',
  yellow = '#f2d49e',
  sun = '#f2d49e',
  purple = '#7a8db0',
  dark_purple = '#64778d',
  teal = '#7fa8c9',
  orange = '#B86A6A',
  cyan = '#7fa8c9',
  statusline_bg = '#0f1114',
  lightbg = '#181a1e',
  pmenu_bg = '#64778d',
  folder_bg = '#64778d',
}

local base16 = {
  base00 = '#090b0d',
  base01 = '#0f1114',
  base02 = '#121417',
  base03 = '#181a1e',
  base04 = '#1e2025',
  base05 = '#adbac7',
  base06 = '#adbac7',
  base07 = '#adbac7',
  base08 = '#8f8fb3',
  base09 = '#7a8db0',
  base0A = '#54657d',
  base0B = '#647f9e',
  base0C = '#7fa8c9',
  base0D = '#54657d',
  base0E = '#7a8db0',
  base0F = '#6f6f87',
}

-- Helper function to set highlights
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor highlights
hi('Normal', { fg = colors.white, bg = transparent and 'NONE' or colors.black })
hi('NormalFloat', { fg = colors.white, bg = transparent and 'NONE' or colors.black2 })
hi('Comment', { fg = colors.grey, italic = italic_comments })
hi('LineNr', { fg = colors.grey, bg = transparent and 'NONE' or colors.black })
hi('CursorLine', { bg = transparent and 'NONE' or colors.one_bg })
hi('CursorLineNr', { fg = colors.white, bold = true, bg = transparent and 'NONE' or 'NONE' })
hi('Visual', { bg = colors.one_bg2 })
hi('VisualNOS', { bg = colors.one_bg2 })
hi('Search', { fg = colors.black, bg = colors.yellow })
hi('IncSearch', { fg = colors.black, bg = colors.orange })
hi('Pmenu', { fg = colors.white, bg = transparent and colors.one_bg2 or colors.one_bg })
hi('PmenuSel', { fg = colors.black, bg = colors.pmenu_bg })
hi('PmenuSbar', { bg = colors.one_bg2 })
hi('PmenuThumb', { bg = colors.grey })
hi('StatusLine', { fg = colors.white, bg = transparent and 'NONE' or colors.statusline_bg })
hi('StatusLineNC', { fg = colors.grey, bg = transparent and 'NONE' or colors.statusline_bg })
hi('VertSplit', { fg = colors.one_bg2, bg = transparent and 'NONE' or 'NONE' })
hi('SignColumn', { bg = transparent and 'NONE' or colors.black })
hi('Folded', { fg = colors.grey, bg = transparent and 'NONE' or colors.one_bg })
hi('FoldColumn', { fg = colors.grey, bg = transparent and 'NONE' or colors.black })
hi('ColorColumn', { bg = transparent and 'NONE' or colors.one_bg })
hi('MatchParen', { fg = colors.cyan, bold = true })

-- Syntax highlights
hi('Constant', { fg = base16.base0F })
hi('String', { fg = base16.base0B })
hi('Character', { fg = base16.base0B })
hi('Number', { fg = base16.base0F })
hi('Boolean', { fg = base16.base0F })
hi('Float', { fg = base16.base0F })
hi('Identifier', { fg = colors.white, italic = italic_variables })
hi('Function', { fg = base16.base08, italic = italic_functions })
hi('Statement', { fg = base16.base08, italic = italic_keywords })
hi('Conditional', { fg = base16.base08, italic = italic_keywords })
hi('Repeat', { fg = base16.base08, italic = italic_keywords })
hi('Label', { fg = base16.base08, italic = italic_keywords })
hi('Operator', { fg = colors.white })
hi('Keyword', { fg = base16.base08, italic = italic_keywords })
hi('Exception', { fg = base16.base08, italic = italic_keywords })
hi('PreProc', { fg = base16.base09 })
hi('Include', { fg = base16.base08 })
hi('Define', { fg = base16.base08 })
hi('Macro', { fg = base16.base08 })
hi('PreCondit', { fg = base16.base09 })
hi('Type', { fg = base16.base09 })
hi('StorageClass', { fg = base16.base09 })
hi('Structure', { fg = base16.base09 })
hi('Typedef', { fg = base16.base09 })
hi('Special', { fg = colors.cyan })
hi('SpecialChar', { fg = colors.cyan })
hi('Tag', { fg = base16.base0A })
hi('Delimiter', { fg = colors.white })
hi('SpecialComment', { fg = colors.grey_fg })
hi('Debug', { fg = colors.red })
hi('Underlined', { underline = true })
hi('Error', { fg = colors.red })
hi('Todo', { fg = colors.yellow, bold = true })

-- Treesitter highlights
hi('@variable', { fg = colors.white, italic = italic_variables })
hi('@keyword', { fg = base16.base08, italic = italic_keywords })
hi('@function', { fg = base16.base08, italic = italic_functions })
hi('@constructor', { fg = base16.base09 })
hi('@constant', { fg = base16.base0F })
hi('@type', { fg = base16.base09 })
hi('@string', { fg = base16.base0B })
hi('@property', { fg = base16.base0A })
hi('@parameter', { fg = colors.white, italic = italic_variables })
hi('@field', { fg = base16.base0A })
hi('@method', { fg = base16.base08, italic = italic_functions })
hi('@namespace', { fg = base16.base09 })
hi('@punctuation.delimiter', { fg = colors.white })
hi('@punctuation.bracket', { fg = colors.white })
hi('@tag', { fg = base16.base08 })
hi('@tag.attribute', { fg = base16.base0A })
hi('@tag.delimiter', { fg = colors.grey })

-- LSP highlights
hi('DiagnosticError', { fg = colors.red })
hi('DiagnosticWarn', { fg = colors.yellow })
hi('DiagnosticInfo', { fg = colors.blue })
hi('DiagnosticHint', { fg = colors.cyan })
hi('LspReferenceText', { bg = colors.one_bg2 })
hi('LspReferenceRead', { bg = colors.one_bg2 })
hi('LspReferenceWrite', { bg = colors.one_bg2 })

-- Git signs
hi('GitSignsAdd', { fg = colors.green })
hi('GitSignsChange', { fg = colors.yellow })
hi('GitSignsDelete', { fg = colors.red })

-- Telescope
hi('TelescopeBorder', { fg = colors.blue })
hi('TelescopePromptBorder', { fg = colors.blue })
hi('TelescopeResultsBorder', { fg = colors.blue })
hi('TelescopePreviewBorder', { fg = colors.blue })
hi('TelescopeSelection', { bg = colors.one_bg2 })
hi('TelescopeSelectionCaret', { fg = colors.blue })

-- NvimTree / Neo-tree
hi('NvimTreeFolderIcon', { fg = colors.folder_bg })
hi('NvimTreeFolderName', { fg = colors.folder_bg })
hi('NvimTreeOpenedFolderName', { fg = colors.folder_bg, bold = true })
hi('NvimTreeNormal', { bg = transparent and 'NONE' or colors.darker_black })
hi('NvimTreeVertSplit', { fg = transparent and colors.one_bg2 or colors.darker_black, bg = transparent and 'NONE' or colors.darker_black })
hi('NvimTreeEndOfBuffer', { fg = transparent and colors.black or colors.darker_black })

-- Additional transparency support
if transparent then
  hi('NeoTreeNormal', { bg = 'NONE' })
  hi('NeoTreeNormalNC', { bg = 'NONE' })
  hi('NeoTreeEndOfBuffer', { fg = colors.black })
end

-- Mini.statusline support
hi('MiniStatuslineDevinfo', { fg = colors.white, bg = transparent and 'NONE' or colors.lightbg })
hi('MiniStatuslineFileinfo', { fg = colors.white, bg = transparent and 'NONE' or colors.lightbg })
hi('MiniStatuslineFilename', { fg = colors.grey_fg, bg = transparent and 'NONE' or colors.statusline_bg })
hi('MiniStatuslineInactive', { fg = colors.grey, bg = transparent and 'NONE' or colors.statusline_bg })
hi('MiniStatuslineModeNormal', { fg = colors.black, bg = colors.blue, bold = true })
hi('MiniStatuslineModeInsert', { fg = colors.black, bg = colors.green, bold = true })
hi('MiniStatuslineModeVisual', { fg = colors.black, bg = colors.purple, bold = true })
hi('MiniStatuslineModeReplace', { fg = colors.black, bg = colors.red, bold = true })
hi('MiniStatuslineModeCommand', { fg = colors.black, bg = colors.yellow, bold = true })
hi('MiniStatuslineModeOther', { fg = colors.black, bg = colors.cyan, bold = true })
