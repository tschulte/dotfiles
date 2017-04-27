autoload -Uz promptinit
autoload colors && colors

battery_status() {
  $ZSH/bin/battery-status
}

if [[ -e /usr/lib/git-core/git-sh-prompt ]]
then
  source /usr/lib/git-core/git-sh-prompt
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
else
  # cheers, @ehrenmurdick
  # http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

  if (( $+commands[git] ))
  then
    git="$commands[git]"
  else
    git="/usr/bin/git"
  fi

  git_branch() {
    echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
  }

  git_dirty() {
    if $(! $git status -s &> /dev/null)
    then
      echo ""
    else
      if [[ $($git status --porcelain) == "" ]]
      then
        echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
      else
        echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
      fi
    fi
  }

  git_prompt_info () {
   ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  # echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
   echo "${ref#refs/heads/}"
  }

  # This assumes that you always have an origin named `origin`, and that you only
  # care about one specific origin. If this is not the case, you might want to use
  # `$git cherry -v @{upstream}` instead.
  need_push () {
    if [ $($git rev-parse --is-inside-work-tree 2>/dev/null) ]
    then
      number=$($git cherry -v origin/$(git symbolic-ref --short HEAD) | wc -l | bc)

      if [[ $number == 0 ]]
      then
        echo " "
      else
        echo " with %{$fg_bold[magenta]%}$number unpushed%{$reset_color%}"
      fi
    fi
  }

  directory_name() {
    echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
  }
  export PROMPT=$'\n$(battery_status)in $(directory_name) $(git_dirty)$(need_push)\n› '
  set_prompt () {
    export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
  }

  precmd() {
    title "zsh" "%m" "%55<...<%~"
    set_prompt
  }
fi
