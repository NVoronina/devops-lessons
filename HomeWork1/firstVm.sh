#!/bin/bash

#generate file
touch ~/$1.txt
{
  echo '¯\_(ツ)_/¯'
} > $1.txt

#send file
rsync -avz  $1.txt ubuntu@$2:/home/ubuntu/files/$1.txt