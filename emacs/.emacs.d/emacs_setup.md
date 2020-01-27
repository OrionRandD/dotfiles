
# How to setup emacs in a new machine:
# Copy these files to the $HOME/.emacs.d in
# the other machine:

# abbrev_defs
# init.el
# local-repo
# rs_emacs.sh
# snippets
# straight.md

# And

# $HOME/org~
# $HOME/reveal-slides
# to your $HOME

# Then, start Emacs
# it will try to build pulling the packages
# from the repositories
# Note: hyperbola distro does not have W3M
# "pacman -S w3m" does NOT work. You have to comment
# w3m lines in init.el

