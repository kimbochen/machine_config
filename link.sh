#!/usr/local/bin/bash


link()
{
    ln -s "$(pwd)/$1" "${HOME}/$2"
}

# link homebrew.cfg .Brewfile
# link "git/git.cfg" ".gitconfig"
link "ssh.cfg" ".ssh"
