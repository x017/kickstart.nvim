-- lua/plugins/terminal.lua
-- Terminals: one floating terminal plus horizontal/vertical in-buffer splits.
-- Keymaps live in lua/config/keymaps.lua under "Terminal".

return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      -- size of the terminal window depending on direction
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      direction = 'float', -- default: floating terminal
      float_opts = {
        border = 'curved',
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
      },
      highlights = {
        FloatBorder = { link = 'FloatBorder' },
      },
      -- hide the bufferline for terminal buffers
      on_open = function()
        vim.cmd 'setlocal nospell'
      end,
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      -- numbered terminals 1-4 (horizontal splits)
      local term = require 'toggleterm.terminal'
      local function numbered(id)
        return function()
          term.Terminal:new({ id = id, direction = 'horizontal' }):toggle()
        end
      end
      for i = 1, 4 do
        vim.keymap.set('n', '<leader>t' .. i, numbered(i), { desc = 'Terminal ' .. i })
      end
    end,
  },
}
