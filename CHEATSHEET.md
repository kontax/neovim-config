# Cheatsheet

Leader key is `,` (comma). `<leader>` below means press `,` first.

## General

| Key | Action |
| --- | --- |
| `<leader>pv` | Open netrw (built-in file browser) |
| `<leader><space>` | Clear search highlight |
| `<leader>l` | Trigger linting for current file (also runs automatically on save/insert-leave) |
| `<leader>mp` | Format file (or selection, in visual mode) |
| `<leader>u` | Toggle undo tree |

## Windows & Buffers

| Key | Action |
| --- | --- |
| `<leader>sv` / `<leader>sh` | Split window vertically / horizontally |
| `<leader>se` | Equalize split sizes |
| `<leader>sx` | Close current split |
| `<leader>b` | List buffers, prompt to switch (`:ls` + `:b`) |
| `<PageUp>` / `<PageDown>` | Previous / next buffer |

## Search (Telescope)

fzf-native is enabled for fast fuzzy matching. `<C-j>`/`<C-k>` move down/up in a picker (matches completion's own up/down keys below).

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files in cwd |
| `<leader>fs` | Live grep (search string) in cwd |
| `<leader>fc` | Grep the string under the cursor |
| `<leader>fb` | List open buffers |
| `<leader>fh` | Search help tags |
| `<leader>fr` | Recently opened files |
| `<leader>fk` | List normal-mode keymaps |

## LSP

Active once a language server attaches to the buffer (`:LspInfo` shows what's running).

| Key | Action |
| --- | --- |
| `K` | Hover documentation |
| `gd` | Go to definition (Telescope picker) |
| `gD` | Go to declaration |
| `gi` | Go to implementation (Telescope picker) |
| `gt` | Go to type definition (Telescope picker) |
| `gR` | Find references (Telescope picker) |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions (normal or visual mode) |
| `<leader>d` | Show diagnostic under cursor (floating window) |
| `<leader>D` | List all diagnostics in buffer (Telescope picker) |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>rs` | Restart LSP |
| `<C-l>` / `<C-h>` (insert/select mode) | Jump to next/previous snippet placeholder |

Lua editing gets extra help from `lazydev.nvim`: completion and hover for Neovim's own API and this config's own modules.

## Trouble (diagnostics/lists UI)

| Key | Action |
| --- | --- |
| `<leader>xx` | Diagnostics (whole workspace) |
| `<leader>xX` | Diagnostics (current buffer only) |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |
| `<leader>cs` | Symbols (document outline) |
| `<leader>cl` | LSP definitions/references in a side panel |

## Git

`vim-fugitive` for commands, `gitsigns.nvim` for inline gutter signs/hunks.

| Key | Action |
| --- | --- |
| `<leader>gs` | Git status |
| `<leader>p` (in the status window) | Git push |
| `<leader>P` (in the status window) | Git pull --rebase |
| `<leader>t` (in the status window) | Prefill `:Git push -u origin <branch>` |
| `gu` / `gh` (in a merge-conflict diff) | Diffget "ours" / "theirs" |
| `]c` / `[c` | Next / previous git hunk (or native diff jump, inside `:Gdiffsplit`) |
| `<leader>hs` / `<leader>hr` | Stage / reset hunk (normal or visual mode, for a selection) |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff buffer against the index |
| `<leader>tb` | Toggle inline current-line blame |

## Completion & Snippets

Type to trigger completion automatically; `friendly-snippets` provides a large library of pre-made snippets via LuaSnip.

| Key | Action |
| --- | --- |
| `<C-j>` / `<C-k>` | Next / previous completion item |
| `<C-Space>` | Force-open completion menu |
| `<CR>` | Confirm selected item |
| `<C-e>` | Abort completion |
| `<C-b>` / `<C-f>` | Scroll documentation popup |
| `<C-l>` / `<C-h>` | Jump to next/previous snippet placeholder (see LSP section) |

## Surround (`nvim-surround`)

Standard mnemonic operators - `ys` (you-surround), `cs` (change-surround), `ds` (delete-surround):

| Key | Action |
| --- | --- |
| `ysiw"` | Surround the word under the cursor with `"` |
| `cs"'` | Change surrounding `"` to `'` |
| `ds"` | Delete surrounding `"` |
| `ys$)` | Surround to end of line with `()` |
| `S"` (visual mode) | Surround the visual selection with `"` |

## Comments

No plugin needed - Neovim's native commenting (0.10+):

| Key | Action |
| --- | --- |
| `gcc` | Toggle comment on current line |
| `gc{motion}` | Toggle comment over a motion (e.g. `gcap` for a paragraph) |
| `gc` (visual mode) | Toggle comment on selection |

## Plugin Overview

| Plugin | Purpose |
| --- | --- |
| `lazy.nvim` | Plugin manager |
| `gruvbox.nvim` | Colorscheme |
| `lualine.nvim` | Statusline + buffer tabline |
| `telescope.nvim` (+ `fzf-native`) | Fuzzy finder for files, text, buffers, LSP results |
| `nvim-treesitter` | Syntax highlighting, indentation - parses code into a real syntax tree instead of regex |
| `nvim-ts-autotag` | Auto-close/rename HTML/JSX tags |
| `mason.nvim` + `mason-lspconfig.nvim` + `mason-tool-installer.nvim` | Installs and wires up language servers, formatters, and linters |
| `nvim-lspconfig` | Default per-language-server configuration |
| `lazydev.nvim` | LSP support for editing this Neovim config itself |
| `nvim-cmp` + `LuaSnip` + `friendly-snippets` | Autocompletion and snippets |
| `conform.nvim` | Formatting on save (`prettier`, `stylua`, `ruff`, `rustfmt`, etc.) |
| `nvim-lint` | Async linting (`eslint_d` for JS/TS) |
| `trouble.nvim` | Unified list UI for diagnostics/quickfix/symbols |
| `vim-fugitive` | Git commands (`:Git status`, `:Git push`, etc.) |
| `gitsigns.nvim` | Inline git change signs, hunk staging, blame |
| `nvim-surround` | Add/change/delete surrounding pairs |
| `nvim-autopairs` | Auto-close brackets/quotes |
| `undotree` | Visual undo history |
| `which-key.nvim` | Popup showing available keys after a prefix (try pressing `,` and waiting) |
| `fidget.nvim` | LSP progress notifications (bottom right) |

## Workflow Suggestions

- **Lost? Press `,` and wait.** which-key shows every available continuation with its description - faster than checking this file for anything already bound.
- **Jumping into unfamiliar code**: `<leader>ff` to find the file, `gd`/`gR` to navigate definitions/references once inside, `<leader>cs` (Trouble symbols) for a quick outline of a large file.
- **Fixing a merge conflict**: open the conflicted file, use `]c`/`[c` to jump between conflict hunks (gitsigns) and `gu`/`gh` inside the actual 3-way diff view to pick a side.
- **Reviewing changes before committing**: `<leader>gs` for the fugitive status window (stage/unstage with `-`, commit with `cc`), or `<leader>hp` on individual hunks for a quick inline preview without leaving the buffer.
- **Format-on-save is already on** for most languages - `<leader>mp` is for the rare case you want to force it (e.g. a filetype without `format_on_save` wired up, or after disabling it temporarily).
- **`<leader>D` vs `<leader>xX`**: `<leader>D` is a quick Telescope list of buffer diagnostics; `<leader>xx`/`<leader>xX` (Trouble) is better for working through a long list since it stays open as a persistent panel.
