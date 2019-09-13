#!/bin/bash 
# Arquivo rs_emacs.sh no diretório /home/vagner/.emacs.d
# Agora digite ':Bash' para obter a sintaxe do Shellscript
# A sintaxe do Bash script é obtida com a instalação do plugin 'WolfgangMehner/bash-support'
# Instale esse plugin com o script '~/bin/spf13-plugins.sh'
# Uncommnet the following lines if you want
# to run this script in "X", or not, and make the adjustments
# to fit your taste...
# if ! [[ -v DISPLAY ]] # test if it is not in Xwindow
# then 
	# echo "You are not on X :p"
# else
	# echo "You are on X :)"
# fi

# Uncomment the following lines - from "if" to "fi"
# if you want to write a script to run as sudo/root
# Testa se o usuário é root ou normal. O usuário root tem o UID=0
#if [[ $UID -ne 0 ]];
#then  printf "Non root user :p\n\nPlease run as root or sudo...\n\n"
#    exit 1
#else
#    echo "Root user"
#fi
echo
rsync -v ~vagner/.emacs.d/emacs.org ~vagner/.emacs.d/emacs_bak.org
rsync -v ~vagner/.emacs.d/emacs.org ~vagner/.emacs.d/emacs_ok.org
rsync -v ~vagner/.emacs ~vagner/.emacs.d/_.emacs_vagner_Cyberwarrior
echo "Done :)"
echo
