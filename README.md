# setup-scripts
Configs and scripts for development.

## vimrc

Copy `vimrc` and `vimrc.plugins` to your home directory and rename to `.vimrc` and `.vimrc.plugins`.

**NOTE**: Please don't exit the file until the gtags_cscope finished. Otherwise, will raise
GTags: GTAGS seems corrupted`

### Prerequisite

```bash
sudo apt-get --purge remove exuberant-ctags
sudo apt-get --purge remove vim*
sudo apt-get --purge autoremove
sudo apt-get autoclean
sudo apt-get update
sudo apt-get -f install python-dev
sudo apt-get -f install python3-dev
sudo apt-get install libncurses5-dev
sudo apt-get install cmake build-essential
sudo apt-get install autoconf pkg-config
sudo apt-get install cscope

# For other 50 languages, such as python,
# need install pygments.
pip install pygments
```

### Dependencies

#### vim 8

```bash
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ \
            --enable-rubyinterp=yes \
            --enable-luainterp=yes \
            --enable-perlinterp=yes \
            --enable-tclinterp=yes \
            --enable-multibyte \
            --enable-cscope \
            --enable-gui=gtk2 \
            --prefix=/usr
make -j8 && install
```

#### Universal-ctags

```bash
# Mac
$ brew tap universal-ctags/universal-ctags
$ brew install --HEAD universal-ctags

# Linux
$ git clone https://github.com/universal-ctags/ctags.git
$ cd ctags
$ ./autogen.sh 
$ ./configure
$ make -j8 && install
```

#### gnu-global

```bash
wget http://tamacom.com/global/global-6.6.2.tar.gz
tar xvf global-6.6.2.tar.gz
cd global-6.6.2
./configure
make -j8 && install
```

#### Macvim

Use macvim in Macos

```bash
brew unlink vim
brew install macvim
brew link vim

# add alias in bash_profile
alias vim=mvim
```

