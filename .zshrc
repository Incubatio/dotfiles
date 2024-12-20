### Ls color ###
export LSCOLORS="BxfxGxdxcxegedabagacAd"
export GOPATH="~/dev/go"

### Alias ###
alias 'updatedb=sudo /usr/libexec/locate.updatedb'
alias 'pingg=ping -c 3 www.google.fr'
alias 'aslog=tail -f ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt'
alias 'aslog2=tail -f ~/Library/Application\ Support/Google/Chrome/Default/Pepper\ Data/Shockwave\ Flash/WritableRoot/Logs/flashlog.txt'
alias 'cd..=cd ..'
alias 'll=ls -l'
alias 'la=ls -ahG'
alias 'lla=ls -al'
alias 'psm=ps -efc -m'
alias 'psaux=ps aux -c'
alias 'ls=ls -G'
alias 'e2=sudo killall e2fsck'
alias 'r=rails'
alias 'dj=python manage.py'
alias 'sr=find . -name "*??*" -print | xargs gsed -i ' #"s/var1/var2/g
alias 'vi=vim'
#find . -name '*' -exec bash -c 'echo mv $0 ${0/stuff1/stuff2}' {} \;
# rename all file to lower case
# for f in * ; do mv -v $f `echo $f | tr '[A-Z]' '[a-z]'`; done
alias 'historyf=history -f'
#alias 'rm=/usr/local/bin/rm'
alias 'myip=curl http://bokunotenshi.free.fr/ip.php'
alias 'vacum=play ~/Documents/Music/vacuum.mp3 &>/dev/null </dev/null &'
alias 'heli=play ~/Documents/Music/heli.mp3 &>/dev/null </dev/null &'
alias "addrm=ln -s $HOME/admin/bin/rm /usr/local/bin/rm"
alias 'delrm=/bin/rm /usr/local/bin/rm'
alias tcpd8080="sudo tcpdump -s 0 -A -i lo0 'tcp port 8080 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'"
alias watchNcompile='find src/io/nfg/wmg -name "*.as" | entr make run'

alias mcs="/Applications/Unity/Hub/Editor/2018.3.2f1/Unity.app/Contents/MonoBleedingEdge/bin/mcs"

### Perforce ###
alias p4changelists="p4 changelists -u \$P4USER"
alias p4changes="p4 changes -u \$P4USER"
alias p4shelved="p4 changelists -u \$P4USER -s shelved"

p4get_last_change() { p4 changelists -u nmorel -m1 | awk '{print $2}' }
alias p4last=p4get_last_change

p4newreview() { p4collab newreview $P4PORT $P4USER $P4CLIENT $1 }

p4opened() {
  if [ -z "$1" ]; then
    #p4 opened -u $P4USER | sed -e 's/#.*//'
    p4 opened -C $P4CLIENT | sed -e 's/#.*//'
  else
    #p4 opened -u $P4USER -c $1 | sed -e 's/#.*//'
    p4 opened -C $P4CLIENT -c $1 | sed -e 's/#.*//'
  fi
} # require changeset_num

p4diff() {
  if [ -z "$1" ]; then
    1=default
  fi
    p4opened $1 | p4 -x - diff - | colordiff
}

p4diff2() { diff -Naus <(p4 print $(p4 where $1 | awk '{print $1;}') | tail -n +2) $1 | colordiff } # require <file_name>

# Unity stuff
alias elog="tail -f ~/Library/Logs/Unity/Editor.log"
alias plog="tail -f ~/Library/Logs/Unity/Player.log"


### Default EDitors ###
export EDITOR=vim


### Style ###
autoload -U colors && colors

### Prompt ###
autoload -U promptinit && promptinit


### History ###
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.zsh_history"

setopt HIST_IGNORE_ALL_DUPS
#each line is added to the history when it is executed
setopt INC_APPEND_HISTORY
#This means that zsh's running in different windows but on the same host (or more generally with the same home directory) share the same history
setopt SHARE_HISTORY
#Extended format for history
setopt EXTENDED_HISTORY
#export HISTCONTROL=ignorespace
#export HISTIGNORE='pwd:ls:ansible*'
setopt -g


### Misc ###
#setopt correctall
setopt autocd
setopt extendedglob
setopt always_to_end

### Keyboard ###
bindkey -e
# bindkey "\177" delete-char
#bindkey    "^[[3~"          delete-char
#bindkey    "^[3;5~"         delete-char

### Error color ###
# exec 2>>(while read line; do
#   print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)
#exec 2>>(colorize `tput setaf 1` `tput sgr0` > /dev/tty &)
#exec 2>>(while read line; do print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)


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
# too much KikooLol
# zstyle ':completion:*:*:*' menu yes select

# Options
zstyle ':completion:*:options'         auto-description '%d'               #
zstyle ':completion:*:options'         description 'yes'

# Last word
insert-last-typed-word() { zle insert-last-word -- 0 -1 }; \
  zle -N insert-last-typed-word; bindkey "\em" insert-last-typed-word


### Archive Functions ###

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
      zip)    zip -rv $1.zip $1 ;;
      *)     echo "Error: $2 is not a valid compression type" ;;
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
      *.tar.gz | *.tgz)  tar -xvzf $1 ;;
      *.tar.bz2 | *.tbz2)  tar -xvjf $1 ;;
      *.tar)      tar -xvf $1 ;;
      *.gz | *.gzip)    gunzip $1 ;;
      *.bz2 | *.bzip2)  bunzip2 $1 ;;
      *.zip)      unzip $1 ;;
      *)       echo "Error: $1 is not a valid archive" ;;
    esac
  else
    echo "Error: $1 is not a valid file"
  fi
  if [ $2 ]; then
    case $2 in
      yes)    rm -f $1 ;;
      no)    ;;
      *)    echo "Error: Unknow option $2" ;;
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


### PATH EXPORTS ####

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/.air/bin:$PATH"
export PATH="$HOME/.unity/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH="$HOME/go";export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export ANDROID_HOME=/usr/local/opt/android-sdk
export AIR_HOME=/Applications/AIRSDK_Compiler



### Presentation and colors ###

#export TERM=xterm-256color
local g="%{$fg[green]%}"
local g2="%{$fg[black]%}"
local r="%{$fg[red]%}"
local b="%{$fg[blue]%}"
local c="%{$fg[cyan]%}"
#local m="%{$fg[magenta]%}"
local m="%{$F[000]%}"
local res="%{$reset_color%}"
local _path="${res}%~"
local ret_status="%?"
local smiley="%(?,%b${g}><')))%B°>%b,${r}%)---(><%)---(%b)"

#PS1="%B%{${c}%}>%n${g}:%1d$r}%#%b "
PS1="%(?,${b}╰ ─
╭─(${_path}${b}%)─==${smiley}${g} %# ,${b}╰ (${_path}%B${b}${smiley}${r} %# )"

RPS1="%B─=>%b${b}[${res}%T${b}]-${res}${ret_status}${b}-[${res}%h${b}]${res}"

local cur_cmd="${b}[%_${b}]"
PS2=" | ${b}➜ ${cur_cmd}> "    #commande incomplete
PS3=" | Selection ? "         # Select
PS4=" | Debug (%N:$i)> "      # Trace

### Welcome messages ###
print -P "${res} Welcome to: ${b}%n@%m"
print -P "${res} Running: ${b}`uname -srm`${res} on ${b}%l"
print -P "${res} Today is: ${b}%D{%r}"

#fpath=(~/myfns $fpath)
#### Correction orthographique
#SPROMPT=" | ${fg[cyan]}➜ correct '%R' to '%r' ? ([Y]es/[N]o/[E]dit/[A]bort) "
#fpath=(~/myfns $fpath)
