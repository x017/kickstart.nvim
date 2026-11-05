-- lua/plugins/theme.lua
-- Colorschemes

return {
  {
    'folke/tokyonight.nvim',
    lazy = true,
  },
  {
    -- your own colorscheme (repo: x017/furusato.nvim, also vendored in colors/furusato.lua)
    'x017/furusato.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.setup = {
        transparent = true,
        italic_comments = true,
        italic_keywords = true,
        italic_functions = true,
        italic_variables = false,
      }
      vim.cmd 'colorscheme furusato'
    end,
  },
}
