FROM local/turbo_base

MAINTAINER Marc Marschall <marc@marschalls.net>

COPY turboscript /
COPY spss24.desktop /tmp/
COPY IBM.tar.gz /opt/
COPY R.desktop /tmp/
COPY Rcmdr.desktop /tmp/
COPY pspp.desktop /tmp/
COPY rstudio.desktop /tmp/
COPY sagemath.desktop /tmp/
COPY www.octave.org-octave.desktop /tmp/
COPY gretl.desktop /tmp/
COPY stata.desktop /tmp/
COPY stata.tar.gz /opt/

RUN 	tar -zxf /opt/IBM.tar.gz -C /opt/ &&\
	tar -zxf /opt/stata.tar.gz -C /opt/ &&\
	rm /opt/IBM.tar.gz &&\
	rm /opt/stata.tar.gz &&\
	export DEBIAN_FRONTEND=noninteractive &&\
	add-apt-repository ppa:aims/sagemath &&\
	add-apt-repository ppa:aims/aims-desktop &&\
	apt-get update &&\
	apt-get install -yq gnuplot octave sagemath-upstream-binary r-base r-recommended r-cran-rcmdr rstudio-upstream-deb  pspp gretl 


CMD ["/turboscript"]
