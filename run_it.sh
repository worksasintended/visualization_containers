#!/bin/bash
user=$(whoami)
uid=$(id -u $user)
gid=$(id -g $user)
pw=$(cat /dev/urandom | tr -dc '0-9' | fold -w 8 | head -n 1)

mkdir -p  /home/$user/share_docker

printf "connect to: \n \033[1m gpu01:1 \033[0m \n"
printf "your password is: \n\n \033[1m  $pw  \033[0m \n\n"

while true; do
  printf "Do you want to run  \n \t [1]turbovnc base docker \n \t [2]paraview docker \n \t [3]VisIt docker \n Type the number and confirm! "
  read input
  if (( ($input) == "1" )); then
   container="turbo_base"
   name="turbovnc"
   break
  elif (( ($input) == "2" )); then
   container="paraview"
   name="paraview"
   break
 elif (( ($input) == "3" )); then 
   container="visit"
   name="visit"
   break;
  fi
done
docker run \
           --rm \
	   --device=/dev/tty:/dev/tty \
	   --device=/dev/tty0:/dev/tty0 \
	   --device=/dev/tty1:/dev/tty1 \
	   --device=/dev/tty2:/dev/tty2 \
	   --device=/dev/tty3:/dev/tty3 \
	   --device=/dev/tty4:/dev/tty4 \
	   --device=/dev/tty5:/dev/tty5 \
	   --device=/dev/tty6:/dev/tty6 \
	   --device=/dev/tty7:/dev/tty7 \
	   --device=/dev/tty7:/dev/tty8 \
	   --device=/dev/fb0:/dev/fb0 \
	   --device=/dev/nvidia0:/dev/nvidia0 \
	   --device=/dev/nvidia1:/dev/nvidia1 \
	   --device=/dev/dri/card0:/dev/dri/card0 \
	   --device=/dev/dri/card1:/dev/dri/card2 \
	   --device=/dev/dri/card1:/dev/dri/card2 \
	   --device=/dev/nvidiactl:/dev/nvidiactl \
	   --device=/dev/nvidia-uvm:/dev/nvidia-uvm \
	   -p 5901:5901 \
	   -v /home/$user/share_docker:/home/$user/share\
 	   -e user=$user\
	   -e uid=$uid \
	   -e gid=$gid \
	   -e pw=$pw\
	   --name $name \
	   -it \
  	  local/$container /bin/bash
exit 0

