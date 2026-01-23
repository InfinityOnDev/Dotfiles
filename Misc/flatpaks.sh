#!/usr/bin/bash
response='N'
echo 'Begin flatpak tools installation? (y/N):'
read response

if [[ "$response" =~ ^[yY]$ ]] ; then
  flatpak install -y \
    io.github.flattool.Warehouse/x86_64/stable \
    app/md.obsidian.Obsidian/x86_64/stable \
    one.ablaze.floorp/x86_64/stable \
    app/com.google.Chrome/x86_64/stable \
    app/com.dec05eba.gpu_screen_recorder/x86_64/stable
  echo 'Installation successful!'
  exit 0
else 
  echo 'Installation aborted!'
  exit 1
fi 

