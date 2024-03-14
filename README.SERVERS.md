# config for servers

install zsh zsh-autosuggestions

sudo chsh -s /usr/bin/zsh `whoami`

```.zshrc
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# initialize autocomplete
autoload -Uz compinit
compinit

if [[ -e /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]
then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

autoload -U select-word-style
select-word-style bash

bindkey -e

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

# Ctrl+Left and Ctrl+Right
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[1;3H" beginning-of-line
bindkey "^[[1;5H" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[1;3F" end-of-line
bindkey "^[[1;5F" end-of-line
bindkey "^[[F" end-of-line

bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char
bindkey '^H' backward-kill-word

# nice prompt
autoload -Uz promptinit
autoload colors && colors

function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    if [[ "$4" != "" ]]
    then
      print -Pn "\e]2;$3 $ $4\a" # plain xterm title ($3 for pwd)
    else
      print -Pn "\e]2;$3\a" # plain xterm title ($3 for pwd)
    fi
    ;;
  esac
}

if [[ -e /usr/lib/git-core/git-sh-prompt || -e /usr/share/git/git-prompt.sh ]]
then
  if [[ -e /usr/lib/git-core/git-sh-prompt ]]
  then
    source /usr/lib/git-core/git-sh-prompt
  else
    source /usr/share/git/git-prompt.sh
  fi
  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWSTASHSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWUPSTREAM="verbose"
  export GIT_PS1_DESCRIBE_STYLE="branch"
  export GIT_PS1_SHOWCOLORHINTS=true
  precmd() {
    title "zsh" "${PWD##*/}" "%55<...<${USERNAME}@translation:%~"
    __git_ps1 "[%{$fg[red]%}$(date +%H:%M)%{$reset_color%}][${USERNAME}@translation:%~" "]$ "
  }
  preexec() {
    title "zsh" "${PWD##*/}" "%55<...<${USERNAME}@translation:%~" "$1"
  }
fi
```
