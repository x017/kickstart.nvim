-- lua/plugins/editor.lua
-- Editing essentials: treesitter, autopairs, comments, formatting,
-- linting, flash navigation, indent guessing, wakatime, lazydev.

return {
  -- ── Syntax highlighting ────────────────────────────
  {
    'nvim-treesitter/nvim-treesitter',
    -- pin to master: the default 'main' branch was restructured and no longer
    -- ships lua/nvim-treesitter/configs.lua
    branch = 'master',
    build = ':TSUpdate',
    config = function()
      -- fail-safe: never hard-crash startup if the clone is missing/stale
      -- (run :Lazy sync to fix a stale clone)
      local ok, configs = pcall(require, 'nvim-treesitter.configs')
      if not ok then
        vim.notify('nvim-treesitter not loaded — run :Lazy sync (or delete ~/.local/share/nvim/lazy/nvim-treesitter)', vim.log.levels.WARN)
        return
      end
      configs.setup {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'query', 'vim', 'vimdoc' },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
      }
    end,
  },

  -- ── Auto pairs ─────────────────────────────────────
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  -- ── Comments (gcc / gc) ────────────────────────────
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  -- ── Formatting (conform) ───────────────────────────
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>fm',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },

  -- ── Linting ────────────────────────────────────────
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('config-lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },

  -- ── Flash jump ─────────────────────────────────────
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
      { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
    },
  },

  -- ── Guess indentation ──────────────────────────────
  { 'NMAC427/guess-indent.nvim' },

  -- ── Wakatime ───────────────────────────────────────
  { 'wakatime/vim-wakatime', lazy = false },

  -- ── Lua dev helpers (for editing this config) ─────
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
