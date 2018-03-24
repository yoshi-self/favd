#!/bin/bash

# bash completion of favd

_favd_bash_complete() {
  # only complete first argument
  if [ $COMP_CWORD -ne 1 ]; then
    return
  fi

  if [ -s ~/.favd_list ]; then
    local favs=`tr "\n" ' ' < ~/.favd_list`
    COMPREPLY=(`tr "\n" ' ' < ~/.favd_list`)
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$favs" -- $cur) )
  fi
}

complete -F _favd_bash_complete favd
