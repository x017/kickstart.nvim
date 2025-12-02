-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local bufferline = require 'bufferline'

return {
  bufferline.setup {
    options = {
      mode = 'buffers',
      style_preset = bufferline.style_preset.minimal,
      indicator = { style = 'icon' },
    },
  },
}
