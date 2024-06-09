FROM archlinux:base-devel

RUN pacman -Syu --noconfirm git neovim curl python3 python-pip zsh zsh-completions &&\
    useradd -m yukinoli -p 1234 -s /usr/bin/zsh

USER yukinoli

RUN cd $HOME &&\
    git clone https://github.com/NvChad/starter ~/.config/nvim &&\
    nvim --headless +qa &&\ 
    cd $HOME
