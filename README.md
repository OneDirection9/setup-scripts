# setup-scripts

Configs and scripts for development.

## Installation

Checked on Ubuntu 16.04.

1. vim: `./install_vim.sh`

2. tmux: `cp tmux.conf .tmux.conf`

3. git: `cp gitconfig .gitconfig`

4. zsh: `./install_zsh.sh`

### Macvim

Use macvim in Macos

```bash
brew unlink vim
brew install macvim
brew link vim

# add alias in bash_profile
alias vim=mvim
```
