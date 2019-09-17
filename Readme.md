
How to manage your dotfiles on github

1. Go to your github account and create a "dotfiles" repositoryand initialize it with a Readme.md file
2. Clone it to your $HOME and give it a ".dotfiles" name
3. Install gnu stow -> "apt install stow" and optionally [xstow and stows - this one is from github]
4. cd ~/.dotfiles/
5. Test it with:
6. echo "This is a dotfile." > mydotfile
7. git add mydotfile
8. git commit -m "create dotfiles repository"
9. ln -s $HOME/.dotfiles $HOME/.mydotfile 
10. ls -la | grep mydotfile

11. Create packages to stow - a package is a folder containing files and/or folders - gnu stow does not symlink single files
12.cd ~/.dotfiles 
13. mkdir emacs && cd emacs 
15. cp ~/.emacs.d/ ~/.emacs.d_bak
16. mv ~/.emacs.d/ emacs/
17. make a .gitignore or .gitignore_global in your "~./.dotfiles" and add some excluding rules
18. stow .emacs.d
19. git add emacs
20. git commit -c "my emacs config"
21. git push
22. Make as many packages as you want. Stow them and push them to your git repository

Source: https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

SSh
Generate an ssh-key to connect to github
https://www.w3docs.com/snippets/git/how-to-generate-ssh-key-for-git.html

and change the access to ssh:
https://help.github.com/em/articles/changing-a-remotes-url

Workflow
1. git add
2. git commit -m "any message"
3. git status
4. git push

Cleaning Ignored Files

In three steps, you can clean up your repository and make sure your ignored items are indeed ignored:

$ git rm -r --cached .
$ git add .
$ git commit -m "Clean up ignored files"

https://www.git-tower.com/learn/git/faq/ignore-tracked-files-in-git

