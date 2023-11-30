#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0);pwd)

cd $HOME
ln -snf $SCRIPT_DIR/.gitconfig .gitconfig
ln -snf $SCRIPT_DIR/.tmux.conf .tmux.conf
ln -snf $SCRIPT_DIR/.vimrc     .vimrc
ln -snf $SCRIPT_DIR/.zshrc     .zshrc
ln -snf $SCRIPT_DIR/.alias     .alias
ln -snf $SCRIPT_DIR/.p10k.zsh  .p10k.zsh

cd $HOME
mkdir -p .config/nvim
cd .config/nvim
ln -snf $SCRIPT_DIR/.vimrc init.vim

cd $HOME
mkdir -p .vim/rc
cd .vim/rc 
ln -snf $SCRIPT_DIR/.vim/rc/dein.toml dein.toml
ln -snf $SCRIPT_DIR/.vim/rc/dein_lazy.toml dein_lazy.toml

