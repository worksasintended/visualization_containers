FROM local/ubuntu_16_04_base

MAINTAINER Marc Marschall <marc@marschalls.net>

COPY virtualgl.deb /tmp/
COPY turbovnc.deb /tmp/
COPY turboscript /
COPY xstartup /tmp/xstartup.turbovnc
COPY init_xorg /tmp/init_xorg
COPY debian-xterm.desktop /tmp/

RUN apt-get update && \
	export DEBIAN_FRONTEND=noninteractive &&\
	add-apt-repository ppa:graphics-drivers/ppa &&\
	apt-get update &&\
	apt-get upgrade -yq && \
	apt-get install -yq x11-common make dkms eog linux-libc-dev libc6-dev patch acpid lib32gcc1 libc6-i386 libgl1 libwayland-client0 libwayland-server0 mesa-utils initramfs-tools nvidia-381-dev xserver-xorg-core cmake&&\
	apt-get install -yq lubuntu-desktop xterm && \
	dpkg -i /tmp/virtualgl.deb && \
	echo -e "1\nn\nn\nY\nx\n" | vglserver_config &&\
	dpkg -i /tmp/turbovnc.deb &&\
	rm /tmp/*deb &&\
	apt-get remove -yq apparmor	
	


CMD ["/turboscript"]
