#!/bin/bash

#
# WUIT Network Auto Authorization Script
# Author: @ShallowAi
# Version: 0.1
#

# Get current IP AND MAC ADDRESS
DHCP_IP=`ip -brief address show enp7s0 | awk '{print $3}' | awk -F/ '{print $1}'`
DEVICE_MAC=`cat /sys/class/net/enp7s0/address`

curl -vv --location 'http://192.168.96.110/api/account/login' \
--header 'Referer: http://192.168.96.110/tpl/default/login_account.html?ip=10.189.58.185&mac=d4%3A54%3A8b%3Af2%3A2d%3A12&nasId=2&url=&wlanacip=10.189.0.1&wlanacname=radius&wlanuserip=10.189.58.185' \
--header 'X-Requested-With: XMLHttpRequest' \
--header 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=' \
--data-urlencode 'password=' \
--data-urlencode 'nasId=2' \
--data-urlencode 'userIpv4=${DHCP_IP}' \
--data-urlencode 'userMac=${DEVICE_MAC}'
