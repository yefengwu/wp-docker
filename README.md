#### wordpress for docker
|Dockerfile | create wp_docker images|
|:-----|:----|
|db_init.sql|init mysql database|
|sources.list|aliyun repos about debian9|
|db.sh|init script for msyql with db_init.sql|
|default|config for nginx|
|wordpress-xx.tar.gz|worepress package,you can update it from wordpress official website|

So you can create wp-docker through allow command
`docker build -t wp:v1 .`
The wp-docker container create command
```
docker run docker run -dit --name demo -v /home/yefeng/wp_sql:/var/lib/mysql -p 8080:80 wp:v1
docker exec demo /bin/bash /root/db.sh
```
This commmand created a directory in host ,it will Keep data persistent. You can execute command of `ls /home/<your username>/wp-sql ` to check it,and it also can transplant to other init-mysql.

