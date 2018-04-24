docker run --device=/dev/ttyUSB0 -v /etc/localtime:/etc/localtime -v /home/pi/domoticz.db:/root/dev-domoticz/domoticz.db:rw -p 3080:3080 -t -i $*
