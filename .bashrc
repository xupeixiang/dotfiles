# ls color for mac
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=01;36:ln=01;35:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.sh=01;31:*.tar=01;31:*.tgz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.py=01;32:*.rb=01;200:*.cpp=01;32:*.h=01;200:*.conf=01;200:*.log=01;200:*.sql=01;32'
export LSCOLORS=GxFxCxDxCxegedabagaced

# ls color for ubuntu both
if [ $OSTYPE = 'linux-gnu' ];then
    alias ls='ls --color=always'
fi

# \h:\W \u\$
export PS1="\[\e[0;30;1m\]· \[\e[32;1m\]Eagle \[\e[0;30;1m\]At \[\e[0;31;1m\]\h\[\e[0;30;1m\]· \[\e[36;1m\]\w\[\e[0;30;1m\]· \[\e[33;1m\]\t\[\e[0;30;1m\] ™ \n\
\[\e[37;1m\]\$ \[\e[0m\]"

# grep color
export GREP_COLOR="1;32"

# alias
alias ll='ls -AFlh'
alias vi='vim'
alias grep='grep --color=always'
alias j='jump'
alias prd='ssh pxu@nycdev01'
alias 201='ssh pxu@192.168.0.201'
alias stg='ssh pxu@stgdev01'
alias cash1='ssh eng@cashbox1.dev.fwmrm.net'
alias cash2='ssh eng@cashbox2.dev.fwmrm.net'
alias cash6='ssh eng@cashbox6.dev.fwmrm.net'
alias cash8='ssh eng@cashbox8.dev.fwmrm.net'
alias tx='tmux'
alias txa='tmux attach -d'
alias dk='docker'

psg () { ps | egrep -i $* | egrep -v egrep; }
llt () { ll -t $* | head; }

# customed cd
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
    if [ $OSTYPE = 'linux-gnu' ];then
        dir -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- && echo
    else
        ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- && echo
    fi
}

# Set auto bash completion for command jump or umark
function _completemarks
{
        local cword=${COMP_WORDS[COMP_CWORD]}
        local mark_list=$(marks | awk -F '->' '{print $1}' | sed 's/*$//g')

        # Only do complete on first argument
        if [ $COMP_CWORD -eq 1 ]; then
            COMPREPLY=($(compgen -W "${mark_list[@]}" -- "$cword"))
        else
            COMPREPLY=()
        fi
            return 0
}

complete -o nospace -F _completemarks jump unmark j
