FROM local/turbo_base

MAINTAINER Marc Marschall <marc@marschalls.net>

COPY turboscript /
COPY paraview.desktop /tmp/
COPY visit/ /opt/visit
COPY mayavi2.desktop /tmp/
COPY visit.desktop /tmp/
COPY www.octave.org-octave.desktop /tmp/

RUN apt-get update && \
	export DEBIAN_FRONTEND=noninteractive &&\
	apt-get install -yq paraview mayavi2 opencv-data libopencv-highgui-dev gnuplot octave libopencv-dev


CMD ["/turboscript"]
