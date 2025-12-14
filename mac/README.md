# Mac Setup

Configuration for macOS productivity tools, designed to complement the existing tmux/neovim workflow.

## Tools Installed

| Tool | Purpose | Config Location |
|------|---------|-----------------|
| **Karabiner Elements** | Keyboard remapping | `~/.config/karabiner/karabiner.json` |
| **LeaderKey** | Vim-style launcher | `~/Library/Application Support/Leader Key/config.json` |
| **AeroSpace** | Tiling window manager | `~/.config/aerospace/aerospace.toml` |
| **JankyBorders** | Focused window border | `~/.config/borders/bordersrc` |

## Keyboard Modifier Hierarchy

Modifiers are layered to avoid conflicts:

```
┌─────────────────────────────────────────────────────────┐
│  AeroSpace (OS windows)     │  Cmd + key               │
├─────────────────────────────────────────────────────────┤
│  tmux (terminal panes)      │  Alt (M) + key           │
├─────────────────────────────────────────────────────────┤
│  neovim (editor splits)     │  Ctrl (C) + key          │
├─────────────────────────────────────────────────────────┤
│  LeaderKey (launcher)       │  Right Cmd (F18)         │
└─────────────────────────────────────────────────────────┘
```

---

## Karabiner Elements

| From | To | Notes |
|------|----|-------|
| Right Cmd | F18 | Triggers LeaderKey |
| Ctrl + h/j/k/l | Arrow keys | Vim-style arrows everywhere |
| Alt + L (Safari only) | Cmd + L | Select URL bar |
| F4 | Open Terminal | Quick terminal access (disabled) |

---

## AeroSpace (Tiling Window Manager)

### Focus Windows
| Shortcut | Action |
|----------|--------|
| `Cmd + h` | Focus left |
| `Cmd + j` | Focus down |
| `Cmd + k` | Focus up |
| `Cmd + l` | Focus right |

### Move Windows
| Shortcut | Action |
|----------|--------|
| `Cmd + Shift + h` | Move window left |
| `Cmd + Shift + j` | Move window down |
| `Cmd + Shift + k` | Move window up |
| `Cmd + Shift + l` | Move window right |

### Workspaces
| Shortcut | Action |
|----------|--------|
| `Cmd + 1-9` | Switch to workspace 1-9 |
| `Cmd + Shift + 1-9` | Move window to workspace 1-9 |
| `Cmd + n` | Next workspace |
| `Cmd + p` | Previous workspace |

### Layout & Window Management
| Shortcut | Action |
|----------|--------|
| `Cmd + o` | Toggle fullscreen |
| `Cmd + Shift + Space` | Toggle floating/tiling |
| `Cmd + /` | Toggle split direction (h/v) |
| `Cmd + w` | Close window |
| `Cmd + -` | Shrink window |
| `Cmd + =` | Grow window |
| `Cmd + r` | Enter resize mode |

### Resize Mode (after `Cmd + r`)
| Key | Action |
|-----|--------|
| `h` | Shrink width |
| `l` | Grow width |
| `j` | Grow height |
| `k` | Shrink height |
| `Esc` / `Enter` | Exit resize mode |

### Multi-Monitor
| Shortcut | Action |
|----------|--------|
| `Cmd + Ctrl + h/j/k/l` | Focus monitor in direction |
| `Cmd + Ctrl + Shift + h/j/k/l` | Move window to monitor |

---

## tmux

### Pane Navigation
| Shortcut | Action |
|----------|--------|
| `M-h` | Focus pane left |
| `M-j` | Focus pane down |
| `M-k` | Focus pane up |
| `M-l` | Focus pane right |

### Pane Management
| Shortcut | Action |
|----------|--------|
| `M-q` | Smart split (auto h/v based on dimensions) |
| `M-w` | Close pane (with confirmation) |
| `M-o` | Toggle pane zoom (fullscreen) |
| `M-Left/Right/Up/Down` | Resize pane |

### Windows (Tabs)
| Shortcut | Action |
|----------|--------|
| `M-t` | New window |
| `M-x` | Close window (with confirmation) |
| `M-1` to `M-9` | Switch to window 1-9 |
| `M-n` | Next window |
| `M-p` | Previous window |
| `M-r` | Rename window |
| `Ctrl-Tab` | Next window (alt) |
| `Ctrl-Shift-Tab` | Previous window (alt) |

### Scrolling & Copy Mode
| Shortcut | Action |
|----------|--------|
| `Ctrl-Shift-K` | Page up / enter copy mode |
| `Ctrl-Shift-J` | Page down |
| `v` | Begin selection (in copy mode) |
| `y` | Copy selection |
| `q` / `Esc` | Exit copy mode |

### Prefix Commands (Ctrl-b)
| Shortcut | Action |
|----------|--------|
| `Prefix + r` | Reload config |
| `Prefix + \|` | Vertical split |
| `Prefix + -` | Horizontal split |
| `Prefix + Ctrl-s` | Save session (resurrect) |
| `Prefix + Ctrl-r` | Restore session (resurrect) |

---

## Neovim

Leader key: `Space`

### Navigation
| Shortcut | Action |
|----------|--------|
| `C-h` | Move to left split |
| `C-j` | Move to lower split |
| `C-k` | Move to upper split |
| `C-l` | Move to right split |
| `J` | Jump forward by paragraph |
| `K` | Jump backward by paragraph |
| `Shift-h` | Previous buffer |
| `Shift-l` | Next buffer |

### Editing
| Shortcut | Action |
|----------|--------|
| `jk` | Exit insert mode |
| `A-j` | Move line down |
| `A-k` | Move line up |
| `<` / `>` | Indent (stays in visual mode) |

### Leader Commands
| Shortcut | Action |
|----------|--------|
| `<Space>w` | Save file |
| `<Space>v` | Vertical split |
| `<Space>h` | Horizontal split |
| `<Space>q` | Close split |
| `<Space>t` | Insert current date |
| `<Space>sf` | Search files (Telescope) |
| `<Space>sg` | Search by grep (Telescope) |
| `<Space><Space>` | Find buffers |
| `<Space>/` | Fuzzy search in buffer |

### LSP (when active)
| Shortcut | Action |
|----------|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code action |

---

## JankyBorders

Adds a colored border around the focused window.

**Current config:** Dark bluish-purple (`#5a4fcf`), 5pt width, rounded corners.

**Color options (edit `~/.config/borders/bordersrc`):**
| Color | Hex (0xAARRGGBB) |
|-------|------------------|
| Dark blue-purple | `0xff5a4fcf` |
| Tokyo Night blue | `0xff7aa2f7` |
| Indigo | `0xff6366f1` |
| Purple | `0xff7c3aed` |

Restart after changes: `brew services restart borders`

---

## LeaderKey

**Trigger:** Right Cmd (remapped to F18 via Karabiner)

**To set the leader key:**
1. The settings window should have opened via `open "leaderkey://settings"`
2. Look for "Leader Key" or "Hotkey" field
3. Click it and press F18 (or your current leader key first, then Cmd+, for settings)
4. Set it to F18

**Current actions (default):**
| Sequence | Action |
|----------|--------|
| `t` | Open Terminal |
| `o → s` | Open Safari |
| `o → e` | Open Mail |
| `o → i` | Open Music |
| `o → m` | Open Messages |

---

## Installation

```bash
# Install tools
brew install --cask karabiner-elements
brew install --cask leader-key
brew install --cask nikitabobko/tap/aerospace
brew install FelixKratz/formulae/borders

# Recommended CLI tools
brew install ripgrep fd bat eza fzf zoxide lazygit

# Copy configs
cp mac/karabiner.json ~/.config/karabiner/karabiner.json
cp mac/aerospace.toml ~/.config/aerospace/aerospace.toml
mkdir -p ~/.config/borders && cp mac/bordersrc ~/.config/borders/bordersrc

# Start services
brew services start borders

# Grant accessibility permissions
# System Settings → Privacy & Security → Accessibility
# Enable: Karabiner-Elements, Karabiner-EventViewer, AeroSpace

# Start AeroSpace
open -a AeroSpace
```

## Troubleshooting

**AeroSpace using wrong bindings:**
```bash
pkill -x AeroSpace && open -a AeroSpace
```

**LeaderKey settings:**
```bash
open "leaderkey://settings"
```

**Check what's running:**
```bash
pgrep -x AeroSpace && echo "AeroSpace running"
pgrep -x Karabiner && echo "Karabiner running"
```
