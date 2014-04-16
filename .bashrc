# ls color for mac
export CLICOLOR=1
export LSCOLORS=GxFxCxDxCxegedabagaced

# ls color for ubuntu both
if [ $OSTYPE = 'linux-gnu' ];then
    alias ls='ls --color=auto'
fi

# \h:\W \u\$
export PS1="\[\e[0;30;1m\]· \[\e[32;1m\]Eagle \[\e[0;30;1m\]At \[\e[0;31;1m\]\h\[\e[0;30;1m\]· \[\e[36;1m\]\w\[\e[0;30;1m\]· \[\e[33;1m\]\t\[\e[0;30;1m\] ™ \n\
\[\e[37;1m\]\$ \[\e[0m\]"

# alias
alias ll='ls -l -a'
alias vi='vim'
alias grep='grep --color=always'
alias j='jump'
alias ss='svn st'
alias ssq='svn st -q'
alias sl='svn log'
alias sll='svn log -l 5'
alias nyc='ssh pxu@nycdev01'
alias 201='ssh pxu@192.168.0.201'
alias stg='ssh pxu@stgdev01'
alias cash1='ssh eng@cashbox1.dev.fwmrm.net'
alias cash2='ssh eng@cashbox2.dev.fwmrm.net'
alias tx='tmux'
alias txa='tmux a'

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
