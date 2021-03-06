link()
{
    if [ ! -f "${HOME}/$2" ]; then
        ln -s "$(pwd)/$1" "${HOME}/$2"
        if [ -e "${HOME}/$2" ]; then
            echo "$2 symlink created."
        fi
    fi
}

link "bash.cfg" ".bash_profile"
link "input.cfg" ".inputrc"

mkdir -p "${HOME}/.config/nvim"
link "nvim.cfg" ".config/nvim/init.vim"

link "ssh.cfg" ".ssh/config"
link "tmux.cfg" ".tmux.conf"
link "git.cfg" ".gitconfig"
link "gitignore.cfg" ".gitignore_global"
link "homebrew.cfg" ".Brewfile"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle -g

chsh -s /bin/bash
/bin/bash -c 'curl -fLo "${HOME}/.local/share"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

conda create -n neovim python=3.8 -y
conda activate neovim
conda install -y neovim
conda deactivate
