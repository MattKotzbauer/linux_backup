# Linux Workspace Backup

Configs and settings to restore my Ubuntu workspace.

## Contents

```
configs/
  .tmux.conf      # tmux config
  .bashrc         # bash config
  .profile        # shell profile
  .gitconfig      # git config
  kitty/          # kitty terminal
  nvim/           # neovim config

gnome/
  gnome-settings.dconf    # full GNOME dump
  wm-keybindings.dconf    # window manager keys
  media-keys.dconf        # custom hotkeys (CopyQ: Ctrl+Shift+H)
  interface.dconf         # theme, fonts, clock
  background.dconf        # wallpaper settings

backgrounds/
  Fuji_san_by_amaral.png  # desktop wallpaper
  background2.png         # kitty terminal background

scripts/
  restore.sh              # automated restore
```

## Quick Restore

```bash
git clone git@github.com:MattKotzbauer/linux_backup.git
cd linux_backup/scripts
./restore.sh
```

## Manual Restore

```bash
# Configs
cp configs/.tmux.conf ~/
cp configs/.bashrc ~/
cp -r configs/kitty ~/.config/
cp -r configs/nvim ~/.config/

# GNOME settings
dconf load /org/gnome/desktop/wm/keybindings/ < gnome/wm-keybindings.dconf
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < gnome/media-keys.dconf

# Wallpaper
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Pictures/Wallpapers/Fuji_san_by_amaral.png"
```

## Key Bindings

- `Ctrl+Shift+H` - CopyQ clipboard manager
- `Alt+Tab` - Switch windows

## Notes

- Kitty terminal uses `background2.png` as a background image (with 0.95 tint)
- Gmail CLI setup at `~/thing/gmail_cli/` (requires separate OAuth setup)
- Editor: nvim (EDITOR and VISUAL env vars)
