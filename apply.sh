#!/bin/bash
echo "applying dotfiles"

# Function to create a backup of a file
backup_item() {
    local item=$1
    local backup_count=1
    local backup_item="$item.beforescript"

    while [ -e "$backup_item" ]; do
        backup_item="${item}.beforescript$backup_count"
        backup_count=$((backup_count + 1))
    done

    mv "$item" "$backup_item"
    echo "Backed up $item to $backup_item"
}

create_symlink() {
    local source=$1
    local target=$2

    if [-e "$target" ]; then
        echo "please backup the file first before overwriting it with a symlink"
        exit 1
    fi
    ln -s "$source" "$target"
    echo "Created a symbolic link for $source at $target"
}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

backup_item "$HOME/.zshrc"
create_symlink "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"


backup_item "$HOME/.zshenv"
create_symlink "$SCRIPT_DIR/.zshenv" "$HOME/.zshenv"
echo "zsh done"

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
