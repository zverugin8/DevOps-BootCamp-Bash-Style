#!/bin/bash
#########################################
# This is a simple NumberJack game.
# Just choose number and mark in by index
#########################################
echo -e "\n NumberJack \n"
ch=0
while [ "$ch" -ne 3 ]; do
  echo  "  
       PLAY : Hit 1 and enter.
       HELP : Hit 2 and enter.
       EXIT : Hit 3 and enter.
      "
  read -r -p "Enter your choice : " ch
  if [ "$ch" -eq 1 ];then
    x=0 
    c=0 
    p=0
    read -r -p "Enter any number between 0 and 9 : " n
    while [ "$c" -eq 0 ]; do
      x=11; 
      r=() 
      while IFS='' read -r line; do
        r+=("$line")
      done < <(shuf -i 0-9 -n 10)
        echo "${r[@]}" 
      for i in {1..10}; do
        a[i]=$i
      done
      echo "${a[@]}"
      read -r -t 5 -p "Enter the index of your number : " x
      if [[ $? -gt 128 ]]; then
        c=1
        break
      fi
      if [ "${r[(($x))-1]}" -eq "$n" ]; then
        echo "Great"
        ((p=p+1))
      else
        c=1
        break
      fi
    done
  elif [ "$ch" -eq 2 ]; then
    echo "HELP: INSTRUCTIONS TO PLAY THE GAME. "
  else
    break
  fi
  if [ "$c" -eq 1 ]; then
    echo -e "\nGAME OVER\n"
    echo "You scored $p points"
  fi
done