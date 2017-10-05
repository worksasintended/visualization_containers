#!/bin/bash
user=$(whoami)
uid=$(id -u $user)
gid=$(id -g $user)
pw=$(cat /dev/urandom | tr -dc '0-9' | fold -w 8 | head -n 1)

mkdir -p  /home/$user/share_docker

printf "connect to: \n \033[1m gpu01:1 \033[0m \n"
printf "your password is: \n\n \033[1m  $pw  \033[0m \n\n"

while true; do
  printf "Do you want to run  \n \t [1]turbovnc base docker \n \t [2]statistics and calculation docker \n \t [3]visualization docker  \n Type the number and confirm! "
  read input
  if (( ($input) == "1" )); then
   container="turbo_base"
   name="turbovnc"
   break
  elif (( ($input) == "2" )); then
   container="statistics_calculation"
   name="statistics_calculation"
   break
 elif (( ($input) == "3" )); then 
   container="visualization"
   name="visualization"
   break;
  fi
done
docker run \
           --rm \
	   --privileged \
	   -p 5901:5901 \
	   -v /home/$user/share_docker:/home/$user/share\
 	   -e user=$user\
	   -e uid=$uid \
	   -e gid=$gid \
	   -e pw=$pw\
	   --name $name \
  	  local/$container
exit 0

