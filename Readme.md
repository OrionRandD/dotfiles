
How to manage your dotfiles on github

1. Go to your github account and create a "dotfiles" repository and initialize it with a Readme.md
2. Clone it to your $HOME
3. Install gnu stow
4. cd ~/dotfiles
5. Test it with:
6. echo "This is a dotfile." > mydotfile
7. git add mydotfile
8. git commit -m "create dotfiles repository"
9. ln -s $HOME/dotfiles $HOME/mydotfile
10. ls -la | grep mydotfile

11. Create packages to stow - a package is a folder - gnu stow does not symlink single files
12.cd ~/dotfiles 
13. mkdir .emacs.d
14. cp ~/.emacs.d/emacs_ok.org .
15. stow .emacs.d
16. Make as many packages as you want. Stow them and push them to your git repository

Source: https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

