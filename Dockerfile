FROM resin/rpi-raspbian

MAINTAINER Stephane BARTHELEMY

RUN \ 
	apt-get update && \
	apt-get upgrade && \
	apt-get install -y cmake apt-utils build-essential git python3-dev && \
	apt-get install -y libboost-dev libboost-thread-dev libboost-system-dev libsqlite3-dev subversion curl libcurl4-openssl-dev libusb-dev zlib1g-dev && \
	apt-get install -y iputils-ping && \
 	apt-get clean && \
 	apt-get autoclean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	cd /root && \
	git clone https://github.com/domoticz/domoticz.git dev-domoticz && \
	cd dev-domoticz &&\
	git pull && \
	cmake -DCMAKE_BUILD_TYPE=Release CMakeLists.txt && \
	make -j 3

EXPOSE 3080

CMD ["/root/domoticz/domoticz", "-www", "3080"]
