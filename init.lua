-- ~/.config/nvim/init.lua
--
-- Clean, organized entry point:
--   lua/config/   -> options, keymaps, autocmds, lazy bootstrap
--   lua/plugins/  -> one file per plugin group (loaded by lazy.nvim)
--   lua/kickstart/-> health checks

require 'config.options'
require 'config.autocmds'
require 'config.keymaps'
require 'config.lazy'
