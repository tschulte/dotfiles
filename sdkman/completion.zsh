if [[ ! -o interactive ]]; then
    return
fi

# fpath=(~/.sdkman/src $fpath)

autoload bashcompinit
bashcompinit

# Stolen from
#   https://github.com/Bash-it/bash-it/blob/master/completion/available/sdkman.completion.bash


_sdkman_complete()
{
  local CANDIDATES
  local CANDIDATE_VERSIONS

  COMPREPLY=()

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $(compgen -W "install uninstall rm list ls use current version default selfupdate broadcast offline help flush upgrade update" -- ${COMP_WORDS[COMP_CWORD]}) )
  elif [ $COMP_CWORD -eq 2 ]; then
    case "${COMP_WORDS[COMP_CWORD-1]}" in
      "install" | "list" | "ls" )
        CANDIDATES="$(echo $SDKMAN_CANDIDATES_CSV | tr ',' ' ')"
        COMPREPLY=( $(compgen -W "$CANDIDATES" -- ${COMP_WORDS[COMP_CWORD]}) )
        ;;
      "uninstall" | "rm" | "use" | "current" | "upgrade" | "default" )
        CANDIDATES=$(__sdkman_cleanup_local_versions)
        COMPREPLY=( $(compgen -W "$CANDIDATES" -- ${COMP_WORDS[COMP_CWORD]}) )
        ;;
      "offline" )
        COMPREPLY=( $(compgen -W "enable disable" -- ${COMP_WORDS[COMP_CWORD]}) )
        ;;
      "selfupdate" )
        COMPREPLY=( $(compgen -W "force" -P "[" -S "]" -- ${COMP_WORDS[COMP_CWORD]}) )
        ;;
      "flush" )
        COMPREPLY=( $(compgen -W "broadcast archives temp" -- ${COMP_WORDS[COMP_CWORD]}) )
        ;;
      *)
        ;;
    esac
  elif [ $COMP_CWORD -eq 3 ]; then
    case "${COMP_WORDS[COMP_CWORD-2]}" in
      "install" )
        _sdkman_candidate_versions ${COMP_WORDS[COMP_CWORD-1]}
        COMPREPLY=( $(compgen -W "$CANDIDATE_VERSIONS" -- ${COMP_WORDS[COMP_CWORD]}) )
        ;;
      "uninstall" | "rm" | "use" | "default" )
        _sdkman_candidate_local_versions ${COMP_WORDS[COMP_CWORD-1]}
        COMPREPLY=( $(compgen -W "$CANDIDATE_VERSIONS" -- ${COMP_WORDS[COMP_CWORD]}) )
        ;;
      *)
        ;;
    esac
  fi

  return 0
}

_sdkman_candidate_local_versions(){

  CANDIDATE_LOCAL_VERSIONS=$(__sdkman_cleanup_local_versions $1)
  CANDIDATE_VERSIONS=$CANDIDATE_LOCAL_VERSIONS
}

_sdkman_candidate_versions(){

  CANDIDATE_LOCAL_VERSIONS=$(__sdkman_cleanup_local_versions $1)
  if [ "$SDKMAN_OFFLINE_MODE" = "true" ]; then
    CANDIDATE_VERSIONS=$CANDIDATE_LOCAL_VERSIONS
  else
    CANDIDATE_ONLINE_VERSIONS="$(curl -s "$SDKMAN_CANDIDATES_API/candidates/$1/linux64/versions/all" | tr ',' ' ')"
    CANDIDATE_VERSIONS="$(echo $CANDIDATE_ONLINE_VERSIONS $CANDIDATE_LOCAL_VERSIONS |sort | uniq ) "
  fi

}

__sdkman_cleanup_local_versions(){

  __sdkman_build_version_csv $1 | tr ',' ' '

}

complete -F _sdkman_complete sdk
