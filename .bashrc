# for color
export CLICOLOR=1

# list export
export LSCOLORS=GxFxCxDxCxegedabagaced

# \h:\W \u\$
export PS1="\[\e[32;1m\]\u@\H \[\e[36;1m\]\w \[\e[33;1m\]\t \$ \[\e[0m\]"

# alias
alias ll='ls -l -a'
alias grep='grep --color=always'

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
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- && echo
}
_completemarks() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    local wordlist=$(find $MARKPATH -type l | awk -F"/" '{printf "%s", $NF}')
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
}
complete -F _completemarks jump unmark
