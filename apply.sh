#!/bin/bash

# implement pacman.conf file edit to allow for parallel downloads and color

echo "installing wanted applications"
sudo pacman -Syu firefox kitty flatpak obsidian blender neovim zsh syncthing starship krita

echo "installing wanted flatpak applications"
flatpak install com.spotify.Client com.discordapp.Discord net.ankiweb.Anki

echo "installing yay"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "installing fonts"

echo "installing dotfiles"

rm ~/.zshrc.beforescript
mv ~/.zshrc ~/.zshrc.beforescript
ln -s ~/Dotfiles/.zshrc ~/.zshrc

rm ~/.zshenv.beforescript
mv ~/.zshenv ~/.zshenv.beforescript
ln -s ~/Dotfiles/.zshenv ~/.zshenv
echo "zsh done"

rm -r ~/.config/nvim.beforescript
mv ~/.config/nvim ~/.config/nvim.beforescript
ln -s ~/Dotfiles/nvim ~/.config/nvim
echo "nvim done"

rm ~/.config/kitty/kitty.conf.beforescript
mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.beforescript
ln -s ~/Dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

rm ~/.config/kitty/kitty-current-theme.conf.beforescript
mv ~/.config/kitty/kitty-current-theme.conf ~/.config/kitty/kitty-current-theme.conf.beforescript
ln -s ~/Dotfiles/kitty/kitty-current-theme.conf ~/.config/kitty/kitty-current-theme.conf
echo "kitty done"

rm ~/.config/starship.toml.beforescript
mv ~/.config/starship.toml ~/.config/starship.toml.beforescript
ln -s ~/Dotfiles/starship.toml ~/.config/starship.toml
echo "starship done"

rm ~/config/dolphinrc.beforescript
mv ~/.config/dolphinrc ~/config/dolphinrc.beforescript
ln -s ~/Dotfiles/dolphinrc ~/.config/dolphinrc
echo "dolfin done"
