#!/bin/bash
# Workspace Restore Script
# Run this on a fresh Ubuntu install to restore configs

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== Workspace Restore ==="

# Install dependencies
echo "Installing packages..."
sudo apt update
sudo apt install -y tmux kitty neovim git curl dconf-cli copyq

# Install nvm + node
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install 20
fi

# Copy configs
echo "Restoring configs..."
cp "$BACKUP_DIR/configs/.tmux.conf" ~/
cp "$BACKUP_DIR/configs/.bashrc" ~/
cp "$BACKUP_DIR/configs/.profile" ~/
cp "$BACKUP_DIR/configs/.gitconfig" ~/
cp -r "$BACKUP_DIR/configs/kitty" ~/.config/
cp -r "$BACKUP_DIR/configs/nvim" ~/.config/

# Restore GNOME settings
echo "Restoring GNOME settings..."
dconf load /org/gnome/desktop/wm/keybindings/ < "$BACKUP_DIR/gnome/wm-keybindings.dconf"
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$BACKUP_DIR/gnome/media-keys.dconf"
dconf load /org/gnome/desktop/interface/ < "$BACKUP_DIR/gnome/interface.dconf"

# Copy wallpaper and set it
echo "Setting wallpaper..."
mkdir -p ~/Pictures/Wallpapers
cp "$BACKUP_DIR/backgrounds/"* ~/Pictures/Wallpapers/
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Pictures/Wallpapers/Fuji_san_by_amaral.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/Pictures/Wallpapers/Fuji_san_by_amaral.png"

# Set editor
echo "Setting default editor..."
echo 'export EDITOR=nvim' >> ~/.bashrc
echo 'export VISUAL=nvim' >> ~/.bashrc

echo "=== Restore Complete ==="
echo "Please restart your terminal or run: source ~/.bashrc"
