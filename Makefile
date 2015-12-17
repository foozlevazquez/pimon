#
install:
	sudo install -m 7555 record_temps.sh /usr/local/bin
	echo "* * * * * root /usr/local/bin/record_temps.sh" > /etc/cron.d/record_temps
