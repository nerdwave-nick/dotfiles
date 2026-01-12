# dotfiles-nvim

Fast Neovim setup with sane defaults and a small, curated plugin set.

## Requirements
- Neovim 0.10+ (uses `vim.loader` and modern LSP APIs)
- `git` and `curl`/`wget` to let `lazy.nvim` bootstrap itself
- Nice-to-have: `ripgrep` for Telescope live grep superpowers

## Install
1) Back up any existing `~/.config/nvim`.
2) Clone:
   ```bash
   git clone https://github.com/nerdwave/dotfiles-nvim ~/.config/nvim
   ```
3) Open Neovim; plugins bootstrap automatically. Run `:Lazy sync` to force.

## Layout
- `init.lua` – enables Lua loader and pulls `lua/nerdwave`.
- `lua/nerdwave/options.lua` – defaults (relative numbers, folds, cursorline).
- `lua/nerdwave/keybinds.lua` – space leader, Telescope/Harpoon/LSP maps.
- `lua/nerdwave/lsp.lua` – loads language configs under `lua/nerdwave/lsp/` and hooks into `blink.cmp`.
- `lua/nerdwave/lazy.lua` – bootstraps `lazy.nvim` and reads `lua/nerdwave/plugins/`.

## Notable plugins
- UI: `catppuccin`, `lualine`, `smear-cursor`, `fidget`.
- Navigation: `telescope.nvim`, `harpoon`, `oil.nvim`.
- Editing: Treesitter, `blink.cmp`, `conform`, `nvim-comment`, `indent-blankline`.
- Git: `gitsigns.nvim` with blame toggle.
- LSP: Mason plus per-language configs in `lua/nerdwave/lsp/*`.

## Key bindings
- Leader `<Space>`.
- Files: `<leader>pf` find, `<leader>ps` live grep, `-` Oil.
- Harpoon: `<leader>a` add, `<C-e>` menu, `<C-h/t/n/s>` slots 1–4.
- Format: `<leader>ff`.
- Git blame: `<leader>tb`.
- LSP: `gd`, `gr`, `<leader>rn`, `[d`/`]d`.

## Maintenance
- Undo at `~/.vim/undodir`; swap/backup disabled.
- After plugin changes run `:Lazy sync` and restart.
