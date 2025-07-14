# Add modern neovim ppa
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt install -y git curl git-delta neovim tmux fzf zoxide stow bat npm python3 python3-pip python3-venv

# MAke neovim the default editor
NVIM_PATH=$(command -v nvim)

# Set default editor
sudo update-alternatives --install /usr/bin/editor editor "$NVIM_PATH" 60
sudo update-alternatives --set editor "$NVIM_PATH"

# Set vi to point to nvim
sudo update-alternatives --install /usr/bin/vi vi "$NVIM_PATH" 60
sudo update-alternatives --set vi "$NVIM_PATH"

# Set vim to point to nvim
sudo update-alternatives --install /usr/bin/vim vim "$NVIM_PATH" 60
sudo update-alternatives --set vim "$NVIM_PATH"

# Install tmux catpuccin theme
mkdir -p ${HOME}/.tmux/plugins/catppuccin
git clone https://git::@github.com/catppuccin/tmux ${HOME}/.tmux/plugins/catppuccin

# If this linux has GUI:
if dpkg -l gnome-session >/dev/null 2>&1; then
  #Install kitty
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  # Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
  # your system-wide PATH)
  ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
  # Place the kitty.desktop file somewhere it can be found by the OS
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
  # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
  cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
  # Update the paths to the kitty and its icon in the kitty desktop file(s)
  sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.config/kitty/icons/kitty.png|g" ~/.local/share/applications/kitty*.desktop
  sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
  #
  # Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
  echo 'kitty.desktop' >~/.config/xdg-terminals.list
  gsettings set org.gnome.desktop.default-applications.terminal exec "$(command -v kitty)"

  # Install JetBrainsMono nerd-fonts
  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
  mkdir -p ${HOME}/.local/share/fonts/
  unzip -d ${HOME}/.local/share/fonts/ JetBrainsMono.zip JetBrainsMonoNerdFontMono-*.ttf
  rm JetBrainsMono.zip

fi
