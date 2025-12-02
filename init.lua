local base = require 'base'
local bufferline = require 'custom.plugins.init'
local keymaps = require 'keymaps'

-- Furusato theme configuration
vim.g.setup = {
  transparent = true, -- Enable transparency
  italic_comments = true, -- Italicize comments (default: true)
  italic_keywords = false, -- Italicize keywords (if, for, while, etc.)
  italic_functions = false, -- Italicize function names
  italic_variables = false, -- Italicize variables
}

-- Load colorscheme
vim.cmd.colorscheme 'furusato'
