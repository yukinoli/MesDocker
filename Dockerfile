FROM archlinux:base-devel

RUN pacman -Sy --noconfirm openssl ncurses wget git neovim curl python3 python-pip tmux &&\
    useradd -m yukinoli -p 1234 -s /usr/bin/zsh

USER yukinoli

RUN wget https://raw.githubusercontent.com/yukinoli/MesDocker/main/.tmux.conf -O /home/yukinoli/.tmux.conf
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN mkdir ~/mnt

RUN cd $HOME &&\
    git clone https://github.com/NvChad/starter ~/.config/nvim &&\
    nvim --headless +qa &&\ 
    cd
