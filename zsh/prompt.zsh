autoload -Uz promptinit
autoload colors && colors

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
    title "zsh" "${PWD##*/}" "%55<...<%~"
    __git_ps1 "[%{$fg[red]%}$(date +%H:%M)%{$reset_color%}][%~" "]$ "
  }
  preexec() {
    title "zsh" "${PWD##*/}" "%55<...<%~" "$1"
  }
fi
