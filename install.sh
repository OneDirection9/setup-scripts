#!/usr/bin/env bash
# Install prerequisite
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
sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip

# For other 50 languages, such as python,
# need install pygments.
pip install pygments
pip3 install pygments

# Install vim8
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

# Install Universal-ctags
if [ "$(uname)" = "Darwin" ]; then
    brew tap universal-ctags/universal-ctags
    brew install --HEAD universal-ctags
else
    git clone https://github.com/universal-ctags/ctags.git
    cd ctags
    ./autogen.sh
    ./configure
    make -j8 && install
fi

# Install gun-global
wget http://tamacom.com/global/global-6.6.3.tar.gz
tar xvf global-6.6.3.tar.gz
cd global-6.6.3
./configure
make -j8 && install

cp vimrc ~/.vimrc
cp vimrc.plugins ~/.vimrc.plugins
cp tmux.conf ~/.tmux.conf
cp gitconfig ~/.gitconfig