# ls color for mac
export CLICOLOR=1
export LSCOLORS=GxFxCxDxCxegedabagaced

# ls color for ubuntu
if [ $OSTYPE = 'linux-gnu' ];then
    alias ls='ls --color=auto'
fi

# \h:\W \u\$
export PS1="\[\e[32;1m\]\u · \[\e[36;1m\]\w · \[\e[33;1m\]\t \$ \[\e[0m\]"

# alias
alias ll='ls -l -a'
alias grep='grep --color=always'
alias j='jump'
alias ss='svn st'
alias ssq='svn st -q'
alias sl='svn log'
alias sll='svn log -l 5'

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
