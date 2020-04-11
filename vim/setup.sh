#!/bin/bash

UNDER='\e[4m'
RED='\e[31;1m'
GREEN='\e[32;1m'
YELLOW='\e[33;1m'
BLUE='\e[34;1m'
MAGENTA='\e[35;1m'
CYAN='\e[36;1m'
WHITE='\e[37;1m'
ENDCOLOR='\e[0m'

vimrc_path=$HOME/.vimrc
if [ -f "$vimrc_path" ]
then
  echo -e "$GREEN Backing up $vimrc_path to $vimrc_path.old $ENDCOLOR"
  cp ${vimrc_path} ${vimrc_path}.old
fi 

ln -fs $PWD/vimrc $vimrc_path 
if [ $? -eq 0 ]
then 
  echo -e "$GREEN Installation finished $ENDCOLOR"
else
  echo -e "$RED Installation failed $ENDCOLOR"
fi

