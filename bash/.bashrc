
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Note: if your '.bashrc' does not load in VirtualConsole, look to see if you have a '.bash_profile' on your 'home' folder, rename it and see if your '.bashrc' loads well...

#####################################################

# setxkbmap -option caps:escape
# swap_capsInX.sh 
# xmodmap ~/.Xmodmap

#####################################################

export PAGER=less
alias less='less -Q'
alias man='man -P "less -Q"'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#####################################################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

#####################################################

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT='%b %d %I:%M %p '
HISTIGNORE="bash:cd:pwd:clear:history:history -d:pwd:exit:ls:ls -la:ll:./configure:make:sudo make install:make install:exit:"

# you have to disable these programs to use 'rsync'

#####################################################

# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#####################################################

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#####################################################

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#####################################################

# export TERM=xterm-256color

# set a fancy prompt (non-color, unless we know we "want" color)
 case "$TERM" in
     xterm-color|*-256color) color_prompt=yes;;
 esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\t\n\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\t\n\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \t\n\w\a\]$PS1"
    ;;
*)
    ;;
esac

#####################################################
# Tmux auto-completion
source tmux_autocompletion.sh

# Tmux PS1
#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
# Tmux bash-completion
# vim ft=sh
# START tmux completion
# This file is in the public domain
# See: http://www.debian-administration.org/articles/317 for how to write more.
# Usage: Put "source bash_completion_tmux.sh" into your .bashrc

#_tmux()
#{
#	local cur prev words cword;
#	_init_completion || return;
#	if [[ $cword -eq 1 ]]; then
#		COMPREPLY=($( compgen -W "$(tmux list-commands | cut -d' ' -f1)" -- "$cur" ));
#		return 0
#	fi
#}
#
#complete -F _tmux tmux
#
# END tmux completion

#####################################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

#####################################################

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

#####################################################

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####################################################

# Emacs aliases

alias emacsg="emacsclient -c"                        # emacs gui
alias emacst="emacsclient -t"                      # used to be "emacs -nw"
alias semacst="sudo emacsclient -t"                # used to be "sudo emacs -nw"
alias emacsgnd="emacsclient -c -a emacs"           # new - opens the GUI with alternate non-daemon

#####################################################

# Emacs config
export ALTERNATE_EDITOR=""
# export EDITOR="emacsclient -t"                  # $EDITOR should open in terminal
# export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI with non-daemon as alternate

[ -s "~/.dnx/dnvm/dnvm.sh" ] && . "~/.dnx/dnvm/dnvm.sh" # Load dnvm

#####################################################

# Note: if your '.bashrc' does not load in VirtualConsole, look to see if you have a '.bash_profile' on your 'home' folder, rename it and see if your '.bashrc' loads well...


#####################################################

# Block cursor in VT
#echo -e "\033[?8c" #white-block blinking cursor
#echo -e '\033[?17;0;64c' #red-block non-blinking cursor
#echo -e '\033[?17;0;60c' #blue-block non-blinking cursor
#echo -e '\033[?17;0;80c' #purple-block non-blinking cursor
#echo -e '\033[?17;0;100c' #yellow-block non-blinking cursor

#####################################################

# https://www.emacswiki.org/emacs/CursorOnLinuxConsole
# Edit your linux term entry. First, produce two files: one for backup, one for editing
# ~$ infocmp linux > ~vagner/bin/linux-term-orig
# ~$ infocmp linux > ~vagner/bin/linux-term-edited
# Now edit linux-term-edited and change the cnorm and cvvis entries. Replace the \E[…c entries with your own \E…c entry. In the case of the big red block cursor, use \E[?17;0;64c
# And then install it
# ~$ tic ~vagner/bin/linux-term-edited

 # If on console, change cursor colour according to
 # /usr/src/linux/Documentation/VGA-softcursor.txt
 # Reset using echo -e '\033[?2c'

 if [ $TERM = 'linux' -a $SHELL == '/bin/bash' ]; then 
     tic ~vagner/bin/cursor-vt-edited
     echo -e '\033[?8c'
 fi

#####################################################

neofetch
# ln -s /usr/share/games/fortune /usr/local/bin/
# fortune bible| cowsay -f sheep
fortune bible| cowsay -f bud-frogs
# verse| cowsay -f sheep

alias elinks="elinks -no-connect"

#####################################################

alias open='xdg-open'
alias rm='rm -iv'
alias mv='mv -uv'
alias vm='mv -uv'
alias cp='cp -urv'
alias rsync='rsync -v'

#alias ls='ls -F --color=auto --group-directories-first'
alias ls='ls -hNF --color=auto --group-directories-first'
alias ll='ls -lhF --color=auto --group-directories-first'
alias la='ls -aF --color=auto --group-directories-first'

alias lf="ls -l | egrep -v '^d'"
alias lfr='ls -d */ --color=auto --group-directories-first'
#alias lfr="ls -l | egrep '^d' --color=auto --group-directories-first"

alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
alias lsda="ls -alF ${colorflag} | grep --color=never '^d'"
alias sl='ls -F --color=auto --group-directories-first'

alias su='su -'
alias sudo='sudo -s'
alias hexchat='LANGUAGE=en_GB.UTF-8:pt_BR.UTF-8:es_ES.UTF-8 hexchat'
alias vue="java -jar ~vagner/Downloads/Vue/vue.jar"
alias killisa="killall ISA.exe"
alias emacas='emacs'
alias emacsdbug='emacs --debug -init'
alias temp='tmp'

# cli pastebin client

# copy/paste for linux machines (Mac style)
alias pbcopy='xclip -selection clipboard'	# copy to clipboard, ctrl+c, ctrl+shift+c
alias pbpaste='xclip -selection clipboard -o'	# paste from clipboard, ctrl+v, ctrl+shitt+v
alias pbselect='xclip -selection primary -o'	# paste from highlight, middle click, shift+insert
alias pbdump='pbpaste | pastebinit | pbcopy'	# dump text to pastebin server
#alias pbcopy="xclip -sel clip"
#alias pbcopy='xsel --clipboard --input'
#alias pbpaste='xsel --clipboard --output'

# alias find='find -iname'

#####################################################

# alias pylote='python ~vagner/Downloads/Pylote/pylote/pylote.pyw'

#####################################################

# PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:~/bin/"

    alias g="grep --color=always"
    alias gi="grep -i --color=always"
    alias x11vnc="x11vnc -noxdamage -clip -forever"

    alias xterm='xterm -fg white -bg black -bd blue -fs 24 -geom 800x600 -T "Visite - http://tecnicolinux.blogspot.com"'
    alias init6='sudo init6'
    alias halt='sudo halt'
    alias reboot='sudo reboot'
    alias edSrcList='sudo vim /etc/apt/sources.list'
    alias abrir='sudo chmod 777 -R /usr/local/bin/; sudo chmod 777 -R /var/cache/apt/archives/'
    alias axel='axel --num-connections=10'
    alias psa='ps auxf'
    alias psg='ps aux | grep'  # alguma coisa
    alias date='echo -ne "${LIGHTBLUE}";date "+%A %B %d, %Y %l:%M %p %Z"'
    alias cal='echo -e "${CYAN}"; cal""'
    #alias hist='history | g $1' # alguma coisa
    alias du='du -sh' # summary human
    alias df='df -h'
    alias nano='nano -m -u'

#####################################################

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob
shopt -s direxpand ## fixes the escape character before $PWD --> "\$PWD/"

#####################################################

# setando o editor padrão.

# vim
export EDITOR="vim"
export VISUAL="vim"

# this sets back emacs
set -o vi 

set editing-mode vi

# opções para o teclado, ótimas para os WMs mais leves.
#setxkbmap -model abnt2 -layout br -variant abnt2
#setxkbmap -option terminate:ctrl_alt_bksp

#####################################################

# extração de arquivos.
# uso: ext arquivo.extensão ->"ext - extrair - arquivo.extensão"
function ext ()
{
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar)                tar xf $1        ;;
      *.tar.bz2 | *.tbz2 )  tar xjvf $1        ;;
      *.tar.gz | *.tgz )    tar xzvf $1     ;;
      *.bz2)                bunzip2 $1       ;;
      *.rar)                unrar x $1     ;;
      *.gz)                 gunzip $1     ;;
      *.zip)                unzip $1     ;;
      *.Z)                  uncompress $1  ;;
      *.7z)                 7z x $1    ;;
      *.xz | *.txz)         tar xJvf $1 ;;
      *)   echo ""${1}" não pode ser extraído()" ;;
     esac
   else
     echo ""${1}" não é um arquivo válido!"
   fi
}

#####################################################

# ejetar CD.
alias ejetar='sudo eject /dev/sr0'

# uso: png2jpeg95 imagem.png imagem.jpeg
alias png2jpeg95='convert -quality 95'

# video como background no Desktop.
alias videodesk='xwinwrap -ni -o 0.6 -fs -s -st -sp -b -nf -- mplayer -wid WID '

#####################################################

# Radio Web.
alias r1='mplayer "http://primary.moodyradiostream.org/conferencecenter.mp3"'
#alias r2='mplayer -playlist "$url.pls"'
#alias r3='mplayer -playlist "$url.pls"'

function tocador ()
{
# Esquema de cores
RED='\e[41m'
BLUE='\e[44m'
CYAN='\e[46m'
NC='\e[0m'

# Especificando o player a ser utilizado.
PLAYER="/usr/bin/mplayer"
#PLAYER="/usr/bin/cvlc"

    while true; do
    clear
    echo ""
    echo " ···················································"
    echo " ·       Selecione uma estação para ouvi-la        ·"
    echo " ·                                                 ·"
    echo -e " ·     $CYAN[space]$NC PAUSA, $CYAN[q]$NC PARA, $CYAN[Ctrl]+[c]$NC SAI     ·"
    echo " ···················································"
    echo ""
    echo " ···················································" 
    echo -e " ·  $BLUE  1 $NC  Moody_proclaim               $BLUE  10 $NC  R10  ·"
    echo -e " ·  $BLUE  2 $NC  R2                           $BLUE  11 $NC  R11  ·"
    echo -e " ·  $BLUE  3 $NC  R3                           $BLUE  12 $NC  R12  ·"
    echo -e " ·  $BLUE  4 $NC  R4                           $BLUE  13 $NC  R13  ·"
    echo -e " ·  $BLUE  5 $NC  R5                           $BLUE  14 $NC  R14  ·"
    echo -e " ·  $BLUE  6 $NC  R6                           $BLUE  15 $NC  R15  ·"
    echo -e " ·  $BLUE  7 $NC  R7                           $BLUE  16 $NC  R16  ·"
    echo -e " ·  $BLUE  8 $NC  R8                           $BLUE  17 $NC  R17  ·"
    echo -e " ·  $BLUE  9 $NC  R9                           $BLUE  18 $NC  R18  ·"
    echo " ···················································"
    echo -e " · Selecione um $BLUE digite $NC de 1 a 18 e tecle $CYAN[ENTER]$NC ·"
    echo " ···················································"
    echo ""
    read choix
    case $choix in
        1)
            mplayer "http://primary.moodyradiostream.org/conferencecenter.mp3"
            ;;
        2)
            mplayer -playlist "http://mixstream.net/stream/usa3-vn/8922/play.pls"
            ;;
        3)
            mplayer -playlist "http://www.powerprogradio.net/playlist/main/playlist.pls"
            ;;
        4)
            mplayer -playlist "http://sv1.vestaradio.com:9500"
            ;;
        5)
            mplayer -playlist "http://sv1.vestaradio.com:7420"
            ;;
        6)
            mplayer -playlist "http://vipicecast.yacast.net/bfm"
            ;;
        7)
            mplayer -playlist "http://fg.impek.tv/listen.pls"
            ;;
        8)
            mplayer -playlist "http://ufg.impek.tv/listen.pls"
            ;;
        9)
            mplayer -playlist "http://fgv.impek.tv/listen.pls"
            ;;
        10)
            mplayer -playlist "http://streaming.radio.funradio.fr:80/fun-1-44-128"
            ;;
        11)
            mplayer -playlist "http://www.mistercouzin.net:8000/listen.pls"
            ;;
        12)
            mplayer -playlist "http://streaming.radio.rtl.fr/rtl-1-44-96"
            ;;
        13)
            mplayer -playlist "http://streaming.radio.rtl2.fr:80/rtl2-1-44-96"
            ;;
        14)
            mplayer -playlist "http://www.tv-radio.com/station/fip_mp3/fip_mp3-128k.m3u"
            ;;
        15)
            mplayer -playlist "http://87.98.146.216/castcontrol/playlist.php?port=8000"
            ;;
        16)
            mplayer -playlist "http://mixstream.net/stream/usa3-vn/8922/play.pls"
            ;;
        17)
            mplayer -playlist "http://www.powerprogradio.net/playlist/main/playlist.pls"
            ;;
        *)
            echo -e "$RED Escolha errada! $NC"
            echo "tente novamente..."
            echo ""
            sleep 2
            clear
            ;;
    esac
    done
}

#####################################################

function giany ()
{
# Esquema de cores
RED='\e[41m'
BLUE='\e[44m'
CYAN='\e[46m'
NC='\e[0m'

# Especificando o player a ser utilizado.
PLAYER="/usr/bin/mplayer"
#PLAYER="/usr/bin/cvlc"


    while true; do
    clear
    echo ""
    echo " ·············································································"
    echo " ·                   Selecione a função que deseja utilizar                  ·"
    echo " ·                                                                           ·" 
 echo -e " ·            Você pode Apertar $CYAN[CTRL]+[C]$NC para Cancelar ou Sair             ·"
    echo " ·············································································"
    echo ""
    echo " ·············································································" 
    echo -e " · $BLUE  1 $NC Redimensionar 80x100      $BLUE  10 $NC  Capturar tela                       ·"
    echo -e " · $BLUE  2 $NC Redimensionar 120x120     $BLUE  11 $NC  Renomear Fotos .jpg                 ·"
    echo -e " · $BLUE  3 $NC Redimensionar 320x240     $BLUE  12 $NC  Renomear Fotos .png                 ·"
    echo -e " · $BLUE  4 $NC Redimensionar 640x480     $BLUE  13 $NC  Capturar Vídeo                      ·"
    echo -e " · $BLUE  5 $NC Redimensionar 720x480     $BLUE  14 $NC  Tirar Espaços e Padronizar Arquivos ·"
    echo -e " · $BLUE  6 $NC Redimensionar 800x600     $BLUE  15 $NC  Tirar Espaços e Padronizar Imagens  ·"
    echo -e " · $BLUE  7 $NC Redimensionar 1024x768    $BLUE  16 $NC  Localizar Arquivos                  ·"
    echo -e " · $BLUE  8 $NC Redimensionar 1600x1200   $BLUE  17 $NC  Gerar Pendrive de Instalação        ·"
    echo -e " · $BLUE  9 $NC Redimensionar 2400x1800   $BLUE  18 $NC  Gerar DVD de Instalação             ·"
    echo " ·············································································"
 echo -e " ·         Selecione um número $BLUE digitando $NC de 1 a 18 e aperte $CYAN[Enter]$NC        ·"
    echo " ·············································································"
    echo ""
    read choix
    case $choix in
        1)
            80x100
            ;;
        2)
            120x120
            ;;
        3)
            320x240
            ;;
        4)
            640x480
            ;;
        5)
            1_para_muan
            ;;
        6)
            800x600
            ;;
        7)
            1024x768
            ;;
        8)
            1600x1200
            ;;
        9)
            2400x1800
            ;;
        10)
            1_captura_tela
            ;;
        11)
            renomear_fotos_jpg
            ;;
        12)
            renomear_fotos_png
            ;;
        13)
            1_capturar_video
            ;;
        14)
            1_tira_espacos_e_padroniza_arquivos
            ;;
        15)
            1_tira_espacos_e_padroniza_imagens
            ;;
        16)
            localizar_gnome
            ;;
        17)
            gerapen1
            ;;
        18)
            geradvd1
            ;;
        *)
            echo -e "$RED Escolha errada! $NC"
            echo "tente novamente..."
            echo ""
            sleep 2
            clear
            ;;
    esac
    done
}

#####################################################

#####################################################

# Mark aliases - http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html

export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

# Mark tab-completion 
# In freeBSD, it is "--printf"

_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

#####################################################

# How to use marks - e.g.

# mark deep - creates a mark
# jump deep - jumps to the mark
# unmark deep - unmarks the mark
# marks - see all the marks

#####################################################

# configuration < https://unix.stackexchange.com/questions/42320/is-there-a-standard-unix-command-to-check-english-verb-conjugation >
# source < http://conjugator.reverso.net/conjugation-english.html >
# Função para conjugar verbos em Inglês

function verbtense () { 
    wget -qO - http://conjugator.reverso.net/conjugation-english-verb-$1.html | \
    sed -n "/>Preterite\|>Past</{s@<[^>]*>@ @g;s/\s\+/ /g;/e I/s/.* I \([^ ]*\) you .*/Simple past: \1/;/ Past/s/ Past /Past participle: /;p}" ; 
}

#####################################################

# Setup for incremental search forward and backward - Ctrl-s and Ctrl-s
[[ $- == *i* ]] && stty -ixon

#####################################################

### Kodi-vlc

if [ -d "$HOME/kodi-vlc/kodi-playercorefactory/bash-scripts" ] ; then
               PATH="$HOME/kodi-vlc/kodi-playercorefactory/bash-scripts:$PATH"
fi

#####################################################

## mplayer auto-completion complete -o bashdefault -o default mplayer


#####################################################
## Programming languages
#####################################################

## Julia lisp
alias julisp='rlwrap julia --lisp'

#####################################################
## lisp
alias clisp='rlwrap clisp'
alias sbcl='rlwrap sbcl'

#####################################################
## scheme
alias guile='rlwrap guile'
alias racket='rlwrap racket'

#####################################################
# alias python='rlwrap python3'
alias python='python3'

#####################################################

#-------- FreeTuxTV - Free IPTV Using Existing Database
# See how to set it up - instructions are in ~vagner/Documents/Hacking/tuxtv_how-to.md
# you have to add those functions in "/etc/bash.bashrc" for all users

## MPD 
# export MPD_HOST=localhost
# export MPD_PORT=6600

#####################################################

## Luke Smith aliases

stty -ixon
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).

if [ "$EUID" -ne 0 ]

then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\]-> \[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\t\n\w\[$(tput setaf 1)\]\[$(tput setaf 7)\] $ \[$(tput sgr0)\]"

else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\]-> [\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\t\n\w\[$(tput setaf 1)\]\[$(tput setaf 7)\] # \[$(tput sgr0)\]"

fi

#Generic shortcuts:
alias ouvmus="ncmpcpp"
alias kam="sudo systemctl stop mpd ; sudo systemctl stop mpd.socket ; ka ncmpcpp"
alias ral="sudo systemctl restart mpd ; sudo systemctl restart mpd.socket ; ouvmus"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias cmux="cmus"
alias temp="tmp"
alias news="newsbeuter"
alias email="neomutt"
alias files="ranger"
alias chat="weechat"
#alias audio="ncpamixer"
alias audio="alsamixer"
alias calender="calcurse"
alias qbible='cd ~/bin/quickbible'

# System Maintainence
#alias atltime="sudo timedatectl set-timezone America/New_York && i3 restart" # Eastcoast time
#alias tuctime="sudo timedatectl set-timezone America/Phoenix && i3 restart" # Arizona time
alias sdn="sudo shutdown -h now"
#alias newnet="sudo systemctl restart NetworkManager" # Refresh wifi
alias nf="clear && neofetch" # Le Redditfetch
#Install an AUR package manually (for Parabola to get AUR access):

# Some aliases
alias svim="sudo vim"
alias svi="sudo vim"
alias vimva="vim -u NONE"
alias gvimva="vim -u NONE"
alias svimva="sudo vim -u NONE"
alias sgvimva="sudo vim -u NONE"
alias vimmin="vim -u ~/.vimrc_minimal"
alias gvimmin="vim -u ~/.vimrc_minimal"
alias svimmin="sudo vim -u ~/.vimrc_minimal"
alias sgvimmin="sudo vim -u ~/.vimrc_minimal"

# vim-everywhere --> win(Super)-v keybinding in stumpwm
# vim-everywhere --> Ctrl-Alt-v keybinding in stumpwm

alias r="ranger"
alias sranger="sudo ranger"
alias ka="killall"
alias tr="transmission-remote"

#alias g="git"
alias gita="git add"
alias gitcm="git commit -m "
alias gitrmrc="git rm -r --cached . "
alias gi="git init"
alias gipom="git push origin master"
alias gitc="git clone"
alias gitpass="git config --global credential.helper cache"
alias gra="git remote add"
alias gsst="git status"

alias nr="npm run"
alias ni="nmp install"
alias nid="nmp install -D"

alias refb="source ~/.bashrc"
# alias ref="shortcuts.sh && source ~/.bashrc" # Refresh shortcuts manually and reload bashrc
alias bars="bash ~/.config/polybar/launch.sh" # Run Polybar relaunch script
#alias bw="wal -i ~/.config/wall.png" # Rerun pywal
weather() { curl wttr.in/$1 ; } # Check the weather (give city or leave blank).

alias mkd="mkdir -pv"

# functions
# create a folder and enter into it
function mkc () {
    mkdir -pv "$@" && cd "$_";
}

# Adding color
alias ls='ls -hNF --color=auto --group-directories-first'
alias crep="grep --color=always" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=xterm256" #Color cat - print file with syntax highlighting.

# Laptop management
#alias lsc="screen.sh l" # Use laptop screen only
#alias vsc="screen.sh v" # Use VGA only
#alias dsc="screen.sh d" # Use both laptop and VGA screen
#alias debase="sudo umount /home/Shared/Videos & screen.sh l && i3 restart" # Prep for taking my ThinkPad off Ultrabase

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias yt-vw="youtube-viewer -C"
alias g-yt-vw="gtk-youtube-viewer"
alias yt-free="FreeTube"

#############################

# Vagner youtube-dl

alias ytnp="youtube-dl -c --no-playlist" #Download only the video inside a playlist
alias ytCurl="youtube-dl --external-downloader-args curl -c --newline"
alias ytWget="youtube-dl --external-downloader-args wget -c --newline"
alias ytvF="youtube-dl -F" # view all formats from a video. Then download the one you want with "-f n(number) or -f type(e.g. 3gp, aac, flv, m4a, mp3, mp4, ogg, wav, webm)" - or (-f worstaudio, worstvideo) - see more details for "formats" on the manpage
alias ytPfree="youtube-dl -c --prefer-free-formats" # Download free video format
alias ytLsub="youtube-dl --list-subs" # list all language subtitles. Then use --sub-lang LANGS (separated by coma to download them). You can embed subtitles in the video with "--embed-subs"
alias ytmp3="youtube-dl -cx mp3" # convert video to mp3
alias ytmp3="youtube-dl -cx" # convert video to "best (default)" audio format
alias ytaufmt='youtube-dl -c --audio-format mp3' # formats are: "best(default)", "aac", "flac", "mp3", "m4a", "opus", "vorbis", "wav". You can embed thumbnail in the audio as cover art "--embed-thumbnail"
alias ytvidfmt="youtube-dl -c --recode-video ogg" #convert to ogg after downloading - options are "mp4,flv,ogg,webm,mkv,avi". If you want to keep the video, add (-k)
alias ytTitle="youtube-dl -c --restrict-filename -o '%(title)s'" #Download video title, getting rid of its ID

#############################

alias ethspeed="speedometer -r eth0"
alias wifispeed="speedometer -r wlan0"
alias starwars="telnet towel.blinkenlights.nl"
#alias tpbs="clear && figlet -c TPB Search && tpb.sh" # Pirate Bay search

# TeX
#alias Txa="cp ~/Documents/LaTeX/article.tex"
#alias Txs="cp ~/Documents/LaTeX/beamer.tex"
#alias Txh="cp ~/Documents/LaTeX/handout.tex"
#alias TC='texclear'

# audio and ouvmus
alias mute="pamixer -m"
alias unmute="pamixer -u"
alias vu="pamixer --allow-boost -i 5"
alias vd="pamixer --allow-boost -d 5"
alias pause="mpc toggle"
alias next="mpc next"
alias prev="mpc prev"
alias trupause="mpc pause"
alias beg="mpc seek 0%"
alias lilbak="mpc seek -10"
alias lilfor="mpc seek +10"
alias bigbak="mpc seek -120"
alias bigfor="mpc seek +120"

#hello-larbs() { sed -i -e '/LARBS/,$d' ~/.config/i3/config ;}

# More good stuff
alias sucp='sudo cp -urv'
alias tmuxks='tmux kill-session' # it will kill the running session
# if you want to kill other session, do: "tmux kill-session $sessionName"
alias sdXmg='ncdu'
alias bigstdirs='du -hs * | sort -rh | head -10'

# transmission torrent downloader
# this is notes for video: http://www.youtube.com/watch?v=ee4XzWuapsE

#############################

#-------- Transmission CLI {{{
#------------------------------------------------------
# lightweight torrent daemon, has option for cli, webui, ncurses, and gui frontend 
# demo video: http://www.youtube.com/watch?v=ee4XzWuapsE
# WebUI:	http://localhost:9091/transmission/web/
# 		http://192.168.1.xxx:9091/transmission/web/
tsm-clearcompleted() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;}
tsm() { transmission-remote --list ;}
	# numbers of ip being blocked by the blocklist
	# credit: smw from irc #transmission
tsm-count() { echo "Blocklist rules:" $(curl -s --data \
	'{"method": "session-get"}' localhost:9091/transmission/rpc -H \
	"$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
	| cut -d: -f 11 | cut -d, -f1) ;}
# demo video: http://www.youtube.com/watch?v=TyDX50_dC0M
tsm-blocklist() { $PATH_SCRIPTS/blocklist.sh ;}		# update blocklist
tsm-daemon() { transmission-daemon ;}
tsm-quit() { killall transmission-daemon ;}
tsm-altspeedenable() { transmission-remote --alt-speed ;}	# limit bandwidth
tsm-altspeeddisable() {	transmission-remote --no-alt-speed ;}	# dont limit bandwidth
tsm-add() { transmission-remote --add "$1" ;}
tsm-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
tsm-pause() { transmission-remote -t"$1" --stop ;}		# <id> or all
tsm-start() { transmission-remote -t"$1" --start ;}		# <id> or all
tsm-purge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tsm-remove() { transmission-remote -t"$1" --remove ;}		# leaves data alone
tsm-info() { transmission-remote -t"$1" --info ;}
tsm-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}

# https://github.com/fagga/transmission-remote-cli
# demo video: http://www.youtube.com/watch?v=hLz7ditUwY8
tsm-ncurse() { transmission-remote-cli ;}

#}}}

#####################################################

## apt(-get) aliases

#alias apt-clean='sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove'
alias pinstall='sudo apt-get install'
alias puninstall='sudo apt-get purge'
alias clean='sudo apt-get clean && sudo apt-get autoclean && sudo apt-get autoremove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias search='sudo apt-cache search --names-only'
alias show='apt-cache show'

alias ed.bashrc='svi ~vagner/.bashrc ~lea/.bashrc ~root/.bashrc'
alias ed.bashrc='svim ~vagner/.bashrc ~lea/.bashrc ~root/.bashrc'

#####################################################

## dpkg aliases
alias destravar='sudo rm /var/lib/dpkg/lock' # unlock dpkg repository key
alias infopack='dpkg -L' #gives information about a given installed package
alias arcofpack='dpkg -S' #show from where an installed archive is
alias infopd='dpkg -I' #show info about a package.deb
alias contarc='dpkg -c' #show the contents of a non installed "package.deb" file 
alias remdeb='sudo dpkg -r' #remove a package.deb, but keep configuration files
alias purgedeb='sudo dpkg -P'
alias architet='dpkg --print-architecture' #show system architecture
alias farchitet='dpkg --print-foreign-architectures' #show system foreign architectures
alias addarchitet='dpkg --add-architecture' #add a foreign architecture
alias pacsinsyst='dpkg --get-selections |grep -v deinstall' # to install same packages from on machine to the other, do: "dpkg --get-selections > list.txt (on one machine) -> (on other machine) sudo apt autoremove && dpkg --clear-selections && sudo dpkg --set-selections < list.txt && sudo apt-get dselect-upgrade"
# to grep a simple list alsdo do: dpkg -l | grep ^ii | awk '{ print $2}' > pacslist.md (then open with 'vim pacslist.md and join the lines with ":%join")

#####################################################

source /etc/bash_completion.d/climate_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias gg='https://google.com'

alias songs='mpc playlist |cat -n |less'
source ~/.vim/bundle/gruvbox/gruvbox_256palette.sh
eval 
            function fixComm () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=bash;
                export TF_ALIAS=fixComm;
                export TF_SHELL_ALIASES=$(alias);
                export TF_HISTORY=$(fc -ln -10);
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                history -s $TF_CMD;
            }
        

alias lyrics='lyvi'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#####################################################
## quvi - a youtube-dl option - cclive also uses libquvi

quvi-dl() {
    quvi get "$1"
}

quvi-stream() {
    quvi dump "$1" -b quiet --exec "$PLAYER %u"
}

#####################################################
## Caps_Lock and Control_L into Escape
ctrl2esc.sh

#####################################################
# wal - pywal
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

#####################################################
# rustc and cargo
export PATH="$HOME/.cargo/bin:$PATH"

#############################

alias bible_verse='fortune bible| cowsay -f bud-frogs'

#############################
# pywal
# wal -i /home/vagner/Pictures/todas_as_fotos/wallpapers/girls_anime/automata_flying.jpg 

