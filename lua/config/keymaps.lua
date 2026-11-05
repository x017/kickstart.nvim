-- lua/config/keymaps.lua
-- All global keymaps, grouped by category.
-- LSP buffer-local keymaps live in lua/plugins/lsp.lua (LspAttach).

local map = vim.keymap.set

-- ── General ─────────────────────────────────────────
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
map('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'Copy whole file' })
map({ 'n', 'x' }, '<leader>fm', function()
  require('conform').format { lsp_fallback = true }
end, { desc = 'Format buffer' })
map('n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'Toggle line numbers' })
map('n', '<leader>rn', '<cmd>set rnu!<CR>', { desc = 'Toggle relative numbers' })

-- ── Insert mode movement ────────────────────────────
map('i', '<C-b>', '<ESC>^i', { desc = 'Move to beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'Move to end of line' })
map('i', '<C-h>', '<Left>', { desc = 'Move left' })
map('i', '<C-l>', '<Right>', { desc = 'Move right' })
map('i', '<C-j>', '<Down>', { desc = 'Move down' })
map('i', '<C-k>', '<Up>', { desc = 'Move up' })

-- ── Windows ─────────────────────────────────────────
map('n', '<C-h>', '<C-w>h', { desc = 'Focus window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus window up' })

-- ── Buffers (tabs via bufferline) ───────────────────
map('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })

-- ── Buffer management ───────────────────────────────
map('n', '<leader>x', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick buffer to close' })
map('n', '<leader>xc', '<cmd>bdelete<CR>', { desc = 'Close current buffer' })
map('n', '<leader>xo', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })
map('n', '<leader>xl', '<cmd>BufferLineCloseLeft<CR>', { desc = 'Close buffers to the left' })
map('n', '<leader>xr', '<cmd>BufferLineCloseRight<CR>', { desc = 'Close buffers to the right' })
map('n', '<leader>xa', '<cmd>bufdo bdelete<CR>', { desc = 'Close all buffers' })
map('n', '<leader>xp', '<cmd>BufferLineTogglePin<CR>', { desc = 'Pin/unpin buffer' })
map('n', '<leader>xy', '<cmd>BufferLinePick<CR>', { desc = 'Pick buffer to jump to' })

-- ── File explorer (neo-tree) ────────────────────────
map('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file explorer' })

-- ── Telescope / Find ────────────────────────────────
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', { desc = 'Find all files (incl. hidden)' })
map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Help tags' })
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'Recent files' })
map('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Fuzzy find in buffer' })
map('n', '<leader>ma', '<cmd>Telescope marks<CR>', { desc = 'Find marks' })
map('n', '<leader>pt', '<cmd>Telescope terms<CR>', { desc = 'Pick hidden terminal' })

-- ── Git ─────────────────────────────────────────────
map('n', '<leader>lg', '<cmd>LazyGit<CR>', { desc = 'LazyGit' })
map('n', '<leader>ld', function()
  require('lazydocker').open()
end, { desc = 'Lazydocker' })
map('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { desc = 'Git commits' })
map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { desc = 'Git status' })

-- ── Diagnostics ─────────────────────────────────────
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics quickfix' })
map('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'LSP diagnostics loclist' })

-- ── Comment ─────────────────────────────────────────
map('n', '<leader>/', 'gcc', { desc = 'Toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'Toggle comment', remap = true })

-- ── Terminal (toggleterm) ───────────────────────────
map({ 'n', 't' }, '<C-t>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle floating terminal' })
map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Floating terminal' })
map('n', '<leader>ts', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Horizontal terminal' })
map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Vertical terminal' })
map('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
map('t', '<C-x>', '<C-\\><C-N>', { desc = 'Exit terminal mode' })

-- ── Which-key ───────────────────────────────────────
map('n', '<leader>wk', function()
  vim.cmd('WhichKey ' .. vim.fn.input 'WhichKey: ')
end, { desc = 'Which-key query' })
