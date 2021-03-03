# dotfiles2

## TMUX
```sh
brew install tmux python
pip3 install powerline-status
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow tmux
```

**Note:** change path to powerline installation in `.tmux.conf` to match the actual `python` version.

Open `tmux` and press `<prefix> + Shift + i` to install plugins from `~/.tmux.conf`.

Use `<prefix> + Shift + u` to update plugins.
