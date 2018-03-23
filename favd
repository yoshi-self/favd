#!/bin/bash

case $1 in
#  '-h' | '--help' )
#    ;;
  '-a' | '--add' )
    # add
    if [ -z $2 ]; then
      # add current dir
      echo $PWD >> ~/.favd_list
      echo "added $PWD to ~/.favd_list"
    else
      # add specified dir
      echo $2 >> ~/.favd_list
      echo "added $2 to ~/.favd_list"
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
