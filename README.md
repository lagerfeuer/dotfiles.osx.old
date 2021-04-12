# dotfiles.osx

## Prerequisites
- aws
- jq
- yq

## Tools
### VIM
```sh
# pre-installed version is without python3 support
brew install vim

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

stow vim
vim
# enter :PlugInstall after opening vim for the first time
```

### TMUX
```sh
brew install tmux python
pip3 install powerline-status
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow tmux
```

**Note:** change path to powerline installation in `.tmux.conf` to match the actual `python` version.

Open `tmux` and press `<prefix> + Shift + i` to install plugins from `~/.tmux.conf`.

Use `<prefix> + Shift + u` to update plugins.

### ZSH
```sh
echo "$SHELL" # make sure shell is zsh
stow zsh
# install ohmyzsh
# install powerlevel10k
```
