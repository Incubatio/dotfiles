# system-wide profile for zsh(1)
#if [ -x /usr/libexec/path_helper ]; then
#	eval `/usr/libexec/path_helper -s`
#fi
 
### Alias ###
alias 'updatedb=sudo /usr/libexec/locate.updatedb'

# Misc
alias 'pingg=ping -c 3 www.google.fr'
alias 'cd..=cd ..'
alias 'll=ls -l'
alias 'la=ls -a'
alias 'lla=ls -al'
alias 'psm=ps -efc -m'
alias 'psaux=ps aux -c'
alias 'ls=ls -hG'
alias 'e2=sudo killall e2fsck'
alias 'r=rails'
alias 'dj=python manage.py'
alias 'fr=find . -name "*??*" -print | xargs sed -i ' #"s/var1/var2/g
alias historyf="history -f"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

### Editeurs par defaut ###
export SVN_EDITOR=vim
export EDITOR=vim

## MacPorts ##
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export MANPATH=$MANPATH:/opt/local/share/man

### Style ###
# Initilise les couleurs
autoload -U colors && colors

### Prompt ###
# Initialise le prompt 
autoload -U promptinit && promptinit

#prompt walters
#export TERM=xterm-256color 
#PS1="%B%{${fg[cyan]}%}>%n%{${fg[green]}%}:%1d%{${fg[red]}%}%#%b "
local blue_op="%{$fg[blue]%}[%b"
local blue_cp="%{$fg[blue]%}]%b"
local path_p="${blue_op}%{$fg[green]%}%~${blue_cp}"
local user_host="${blue_op}%n%{$fg[blue]%}@%b%m${blue_cp}"
local ret_status="%?"
local hist_no="%h"
local smiley="%(?,%{$fg[green]%}>%b%{$fg[green]%}<')))%B°>%b,%{$fg[red]%}%)-(><%)-(%b)"
local prompt="%(?,
%B╭─(%b${hist_no}%B)─=>%b${user_host}%B─=>%b${path_p}
%B╰ ─=${smiley} %# ,%B╰ ─=${smiley} %# )"

local cur_cmd="${blue_op}%_${blue_cp}"
PS2=" | ${fg[blue]}➜ ${cur_cmd}> "		#commande incomplete
RPS1="${ret_status}-[%B%T%b]"
PS3=" | Selection ? "                              # Select
PS4=" | Debug (%N:$i)> "                           # Trace

fpath=(~/myfns $fpath)

#### Correction orthographique
SPROMPT=" | ${fg[cyan]}➜ correct '%R' to '%r' ? ([Y]es/[N]o/[E]dit/[A]bort) "
#fpath=(~/myfns $fpath)

### History ###

export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.zsh_history"

setopt HIST_IGNORE_ALL_DUPS
#each line is added to the history when it is executed
setopt INC_APPEND_HISTORY
#This means that zsh's running in different windows but on the same host (or more generally with the same home directory) share the same history
setopt SHARE_HISTORY
#Extended format for history
setopt EXTENDED_HISTORY


### Misc ###

setopt correctall
setopt autocd
setopt extendedglob 
setopt always_to_end 

### Keyboard ###

bindkey -e
# bindkey "\177" delete-char
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

### Error color ###
# exec 2>>(while read line; do
#   print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)
exec 2>>(colorize `tput setaf 1` `tput sgr0` > /dev/tty &)


### Auto Completion ###

autoload -U compinit && compinit 

#Completion
zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*:approximate:*' max-errors par 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'


zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*:descriptions' no
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}Sorry, no matches.%{\e[0m%}'

#zstyle ':completion:*:*:kill:*' verbose yes
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -A -o pid,%cpu,%mem,comm'

# Menu
# to much KikooLol
# zstyle ':completion:*:*:*' menu yes select

# Options
zstyle ':completion:*:options'         auto-description '%d'               #
zstyle ':completion:*:options'         description 'yes'   

# Last word
insert-last-typed-word() { zle insert-last-word -- 0 -1 }; \
  zle -N insert-last-typed-word; bindkey "\em" insert-last-typed-word

### Functions ###

# Smart Compress 
# Usage : smartcompress file [type]
compress() {
	if [ $2 ]; then
        	case $2 in
                	tgz | tar.gz)   tar -zcvf $1.$2 $1 ;;
                        tbz2 | tar.bz2) tar -jcvf $1.$2 $1 ;;
                        tar)            tar -cvf $1.$2  $1 ;;
                        gz | gzip)      gzip $1 ;;
                        bz2 | bzip2)    bzip2 $1 ;;
			zip)		zip -rv $1.zip $1 ;;
                        *) 		echo "Error: $2 is not a valid compression type" ;;
                esac
	else
                smartcompress $1 tar.gz
        fi
}

# Smart Extract
# Usage : smartextract file
extract() {
	if [[ -f $1 ]]; then
		case $1 in
			*.tar.gz | *.tgz)	tar -xvzf $1 ;;	
			*.tar.bz2 | *.tbz2)	tar -xvjf $1 ;;
			*.tar)			tar -xvf $1 ;;
			*.gz | *.gzip)		gunzip $1 ;;
			*.bz2 | *.bzip2)	bunzip2 $1 ;;
			*.zip)			unzip $1 ;;
			*) 			echo "Error: $1 is not a valid archive" ;;
		esac
	else
		echo "Error: $1 is not a valid file"
	fi
	if [ $2 ]; then
		case $2 in
			yes)		rm -f $1 ;;
			no)		;;
			*)		echo "Error: Unknow option $2" ;;
		esac
	fi	 
}

function ip {

if [ "$1" = "a" ] || [ -z "$1" ] ; then

  for i in ` ifconfig | sed -n '/^en[0-9]/p' | awk -F " " '{print $1}' | tr -d ':' `
do

   echo "$i :"
   ifconfig $i | grep xf | awk -F " " '{print "        "$1,$2}'
   ifconfig $i | grep xf | awk -F " " '{print "        "$5,$6}'
   ifconfig $i | grep eth
  done

else

  echo "$1 :"
  ifconfig $1 | grep xf | awk -F " " '{print "        "$1,$2}'
  ifconfig $1 | grep xf | awk -F " " '{print "        "$5,$6}'
  ifconfig $1 | grep eth

fi
}

autoload -U tetris
zle -N tetris
bindkey "\el" tetris

source /Users/incubatio/.rvm/scripts/rvm
