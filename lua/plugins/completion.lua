-- lua/plugins/completion.lua
-- Autocompletion with nvim-cmp (async by design: sources are queried in the
-- background and never block typing). Tuned to feel instant, not bloated.

return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        opts = {},
      },
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        -- snappy async tuning: query often but cheaply, bail on slow sources
        performance = {
          debounce = 30, -- ms before re-querying after you stop typing
          throttle = 20, -- min ms between queries
          fetching_timeout = 150, -- drop a source that takes longer than this
          max_view_entries = 8, -- short menu = less to render
        },

        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        preselect = cmp.PreselectMode.None, -- nothing auto-selected

        window = {
          completion = cmp.config.window.bordered {
            border = 'rounded',
            winhighlight = 'Normal:NormalFloat,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
          },
          documentation = false, -- no doc popup while typing (less bloat)
        },

        -- style each menu entry: kind icon + source tag
        formatting = {
          format = function(entry, vim_item)
            local kind_icons = {
              Text = '󰉿', Variable = '', Method = '󰆧', Function = '󰊕', Constructor = '',
              Field = '', Property = '', Class = '', Interface = '', Module = '',
              Unit = '', Value = '', Enum = '', Keyword = '', Snippet = '', Color = '',
              File = '', Reference = '', Folder = '', EnumMember = '', Constant = '',
              Struct = '', Event = '', Operator = '', TypeParameter = '',
            }
            vim_item.kind = ('%s %s'):format(kind_icons[vim_item.kind] or '', vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = '[LSP]',
              buffer = '[Buffer]',
              path = '[Path]',
              luasnip = '[Snippet]',
            })[entry.source.name]
            return vim_item
          end,
        },

        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        -- few, fast sources — LSP + current buffer first, path as fallback
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        }, {
          { name = 'path' },
        }),
      }
    end,
  },
}
