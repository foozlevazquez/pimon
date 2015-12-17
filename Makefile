#
install:
	sudo install -m 7555 record_temps.sh /usr/local/bin
	echo "* * * * * root /usr/local/bin/record_temps.sh" > /etc/cron.d/record_temps
	grep -q w1-gpio /etc/modules || echo "w1-gpio" >> /etc/modules
	grep -q w1-therm /etc/modules || echo "w1-therm" >> /etc/modules
	grep -q w1-gpio /boot/config.txt || echo "dtoverlay=w1-gpio,gpiopin=4" >> /boot/config.txt
	echo "Reboot to get check modules on boot"
