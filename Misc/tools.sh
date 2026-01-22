#!/usr/bin/bash

# Essential tools 

response='N'

echo 'This script will download all essential tools, proceed ?: (y/N)'
read response 

if [[ "$response" == 'y' ]]; then 

  echo 'Initializing essential tools download...'

  sudo dnf install \
    neovim kitty btop git clang cargo npm pipx wget ripgrep \
    fd-find zoxide wl-clipboard gnome-tweaks mpv cronie \
    zathura zathura-pdf-mupdf zathura-djvu
  echo 'Essential tools installation complete.'
else 
  echo 'Tools download aborted.'
fi

# Getting cool wallpapers
echo 'Proceed with wallpaper download?: (y/N)'
read response

if [[ "$response" == 'y' ]]; then 
  echo 'Downloading Wallpapers (~/Pictures/Wallpapers/)'
  mkdir -p ~/Pictures/Wallpapers/
  cd ~/Pictures/Wallpapers/ || exit 1 

  if [[ ! -d wallpaper ]]; then
    git clone https://github.com/mylinuxforwork/wallpaper
    echo 'Wallpaper download complete.'
  else 
    echo 'Wallpaper already exists, skipping clone.'
  fi 
  echo 'Installation successful!'
  exit 0 
else 
  echo 'Action aborted. Exiting...'
  exit 1 
fi 

