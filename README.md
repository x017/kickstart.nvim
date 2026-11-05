# kickstart.nvim

Starter configuration, organized into clean modules:

```
init.lua                  entry point
lua/
  config/
    options.lua           all vim options
    keymaps.lua           all global keymaps (grouped by category)
    autocmds.lua          global autocmds + winbar breadcrumbs
    lazy.lua              lazy.nvim bootstrap (loads lua/plugins/*)
  plugins/
    theme.lua             colorschemes
    lsp.lua               mason + lspconfig + fidget (pylyzer spam silenced)
    completion.lua        nvim-cmp async autocompletion
    telescope.lua         fuzzy finder
    terminal.lua            toggleterm: floating + split terminals
    ui.lua                  bufferline (solid bar), lualine, which-key, neo-tree
    editor.lua              treesitter, autopairs, comments, conform, lint, flash
    git.lua               gitsigns, lazygit, lazydocker
    extras.lua            misc plugins
  kickstart/
    health.lua            :checkhealth support
```

Essential tools included: LSPs (via mason), async completion (nvim-cmp), telescope, treesitter, git integration.

Run `:AsciiArt` for a random ASCII banner, and check the dashboard on startup.
