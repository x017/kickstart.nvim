-- lua/plugins/ui.lua
-- Interface plugins: dashboard, bufferline, lualine,
-- which-key, indent guides, todo highlights, mini.nvim, neo-tree.

return {
  -- ── Dashboard (compact 'hyper' theme: no blank bars between items) ──
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'hyper',
      config = {
        header = { 'NVIM' },
        shortcut = {
          { icon = '  ', desc = 'New file', key = 'e', action = 'enew' },
          { icon = '  ', desc = 'Find file', key = 'f', action = 'Telescope find_files' },
          { icon = '  ', desc = 'Recent files', key = 'r', action = 'Telescope oldfiles' },
          { icon = '󰊢  ', desc = 'LazyGit', key = 'g', action = 'LazyGit' },
          { icon = '  ', desc = 'Quit', key = 'q', action = 'qa' },
        },
        packages = { enable = false },
        project = { enable = false },
        mru = { enable = false },
        footer = { '⚡ kickstart.nvim — ready to code' },
      },
    },
  },

  -- ── Buffer tabs ────────────────────────────────────
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = 'buffers',
        numbers = 'buffer_id',
        -- solid bar look: always visible, filled background, chunky separators
        always_show = true,
        separator_style = 'padded_slant',
        indicator = { style = 'none' },
        diagnostics = 'nvim_lsp',
        hover = { enabled = true, reveal = { 'close' } },
        offsets = {
          { filetype = 'neo-tree', text = '  File Explorer', text_align = 'center' },
        },
      },
      highlights = {
        fill = { bg = '#0f1114' }, -- the bar itself
        background = { bg = '#0f1114' },
        separator = { fg = '#0f1114', bg = '#0f1114' },
        buffer_selected = { bg = '#1e2025', bold = true },
      },
    },
  },

  -- ── Statusline ─────────────────────────────────────
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '│', right = '│' },
        disabled_filetypes = { statusline = { 'neo-tree' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },

  -- ── Keymap hints ───────────────────────────────────
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>f', group = '  Find (telescope)' },
        { '<leader>g', group = '󰊢  Git' },
        { '<leader>h', group = 'Git hunk', mode = { 'n', 'v' } },
        { '<leader>t', group = '󰔡  Toggle / Terminal' },
        { '<leader>d', group = '󰒕  Diagnostics' },
        { '<leader>x', group = '󰅖  Buffer' },
        { 'gr', group = ' LSP goto', mode = 'n' },
      },
    },
  },

  -- ── Indent guides ──────────────────────────────────
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  -- ── Todo highlights ────────────────────────────────
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- ── mini.nvim (ai text objects, surround, statusline helpers) ──
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
    end,
  },

  -- ── File explorer ──────────────────────────────────
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    opts = {
      window = { width = 32 },
      filesystem = {
        follow_current_file = { enabled = true },
      },
    },
  },
}
