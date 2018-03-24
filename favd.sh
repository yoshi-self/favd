#!/bin/bash

# check whether dir is already added in fav list
check_dir_exists_in_list() {
  if [ -s ~/.favd_list ]; then
    favs=(`tr "\n" ' ' < ~/.favd_list`)
    for fav in ${favs[@]}; do
      if [[ $fav = $1 ]]; then
        # found
        echo 1
        return
      fi
    done
    echo 0
  else
    echo 0
  fi
}

echo_usage() {
  echo "
Usage:

favd -a             Add current directory to fav list
favd -a /some/path  Add specified directory to fav list
favd -l             Show list of faved directories
favd [number]       cd to the directory with number shown in 'favd -l'
favd [not number]   Partial match with fav list and cd if only one matched

Note: cd doesn't work in current shell
      unless this script is executed by \"source\" command

For more information: https://github.com/yoshi-self/favd
"
}

# no argument
if [ $# -lt 1 ]; then
  echo_usage
  # NOTE: this script is executed by 'source', return instead of exit
  return
fi

case $1 in
  '-h' | '--help' )
    echo_usage
    ;;
  '-a' | '--add' )
    # add
    if [ -z $2 ]; then
      # add current dir
      new_dir=$PWD
      #echo $PWD >> ~/.favd_list
      #echo "Added $PWD to ~/.favd_list"
    else
      # add specified dir
      new_dir=$2
      #echo $2 >> ~/.favd_list
      #echo "Added $2 to ~/.favd_list"
    fi

    # check if dir already added
    exists=`check_dir_exists_in_list $new_dir`
    if [ $exists -eq 0 ]; then
      # new, then add
      echo "Added $new_dir to ~/.favd_list"
      echo $new_dir >> ~/.favd_list
    else
      # exists, then don't add
      echo "Directory $new_dir already exists in faved list"
    fi
    ;;
  '-l' | '-ls' | '--list' )
    # list favs
    if [ -s ~/.favd_list ]; then
      # show list with line numbers
      nl ~/.favd_list
    else
      # list empty or not exist
      echo "No directory faved"
    fi
    ;;
  * )
    # create list file if not exist
    if [ -e ~/.favd_list ]; then
      touch ~/.favd_list
    fi

    # create array from lines
    favs=(`tr "\n" ' ' < ~/.favd_list`)

    # when argument is number: go to n-th line of .favd_list
    if [[ $1 =~ ^[0-9]+$ ]]; then
      if [ $1 -gt ${#favs[@]} ]; then
        echo 'Number out of faved directories'
      else
        index=`expr $1 - 1`
        dest=${favs[$index]}
        echo "cd $dest"
        cd $dest
      fi
    else
    # else: try to match dirname with argument, cd if only one dir matched
      found=0
      dest=""
      for fav in ${favs[@]}; do
        if [[ $fav =~ $1 ]]; then
          found=`expr $found + 1`
          dest=$fav
        fi
      done
      if [ $found -eq 0 ]; then
        # not found
        echo 'Directory not found'
      elif [ $found -eq 1 ]; then
        # matched only one then go
        echo "cd $dest"
        cd $dest
      else
        # matched more than 1
        echo 'Argument ambiguous'
      fi
    fi
    ;;
esac
