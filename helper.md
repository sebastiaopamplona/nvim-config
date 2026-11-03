# Shortcuts

Leader is `Space`.

## lazy.nvim (plugin manager)

Open the UI with `:Lazy`. Inside it:

| Key | Action |
|---|---|
| `I` | Install missing plugins |
| `U` | Update plugins (and `lazy-lock.json`) |
| `S` | Sync: install + clean + update |
| `X` | Clean: remove plugins no longer in the config |
| `C` | Check for updates without installing them |
| `R` | Restore plugins to the versions in `lazy-lock.json` |
| `L` | Show recent update log |
| `P` | Profile startup time |
| `Enter` | Expand details of the plugin under the cursor |
| `?` | Help |
| `q` | Close |

The same actions work as commands, e.g. `:Lazy update`, `:Lazy sync`, `:Lazy restore`.

## render-markdown (markdown preview)

| Key | Action |
|---|---|
| `Space m` | Toggle the rendered preview (in markdown files) |

While on, the line under the cursor shows raw markdown so you can still edit it.

## nvim-tree (file tree)

| Key | Action |
|---|---|
| `Space n` | Toggle the tree (opens on the current file) |

Inside the tree:

| Key | Action |
|---|---|
| `Enter` / `o` | Open file (hides the tree), or expand/collapse folder |
| `l` | Unfold folder (does nothing on files) |
| `h` | Fold folder and all its subfolders (on a file, folds the folder it's in) |
| `Ctrl-v` / `Ctrl-x` | Open in vertical / horizontal split |
| `Ctrl-t` | Open in new tab |
| `a` | Create file (end with `/` for a folder) |
| `r` | Rename |
| `d` | Delete |
| `x` / `c` / `p` | Cut / copy / paste |
| `y` / `Y` | Copy name / relative path |
| `-` | Go up to the parent directory |
| `Ctrl-]` | Make the folder under the cursor the root |
| `H` | Show/hide dotfiles |
| `R` | Refresh |
| `E` / `W` | Expand all / collapse all |
| `g?` | Show all keys |
| `q` | Close |

[asd](google.com)
