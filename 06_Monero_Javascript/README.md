### Monero JavaScript网页挖矿

在Victim全盘查找js文件，并插入网页挖矿JS脚本document.write('');


#### 批量替换命令
> 注意替换 `OMINEId` 和 `MD5` 值,因为这是木马随机生成的。
~~~
find / -name '*.js' | xargs sed -i 's/^document.*OMINEId.*e02cf4ce91284dab9bc3fc4cc2a65e28.*$//g'
~~~
