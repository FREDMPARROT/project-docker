#!/bin/bash
#------------------------------------
# RUN DOCKER DEBIAN
# ------------------------------------
docker run -it -p 1000:80 --name srv-prod -d fredmdebian /bin/bash

#------------------------------------
# RUN DOCKER PRESTASHOP
# ------------------------------------
# create a network for containers to communicate
#docker network create prestashop-net

# launch mysql 5.7 container
docker run -ti --name srv-mysql --network prestashop-net -e MYSQL_ROOT_PASSWORD=admin -p 3307:3306 -d mysql:5.7

# launch prestashop container
docker run -ti --name srv-prestashop --network prestashop-net -e DB_SERVER=srv-mysql -p 1001:80 -d prestashop
# ------------------------------------
# ------------------------------------
# RUN DOCKER NETDATA
# ------------------------------------
docker run -d --name=srv-netdata \
  -p 1002:19999 \
  -v netdataconfig:/etc/netdata \
  -v netdatalib:/var/lib/netdata \
  -v netdatacache:/var/cache/netdata \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  --restart unless-stopped \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata

# ------------------------------------
exit 0
