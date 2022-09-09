#!/bin/bash
#http://g06u30.nn2000.info/cgi-bin/engine.sh?val_x=../public_html/sh/main/page_1/index.htm&val_y=абв
#https://www.tldp.org/LDP/abs/html/index.html
#https://ss64.com/bash/
echo "Content-type: text/html"
echo ""
echo '<!DOCTYPE html>'
echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Допущены к тестированию</title>'
echo '</head>'
echo '<body>'
echo '<pre>'
echo ''
date 
echo ''
cat  /var/www/marshirov/data/bim.nn2000.info/public_html/login_ip.txt > /var/www/marshirov/data/bim.nn2000.info/public_html/testing/ip_list.txt
echo '---'
echo ''

cd  /var/www/g06/g06u09/public_html/
echo '--список из раздела--'
pwd
cat  login_ip.txt
cat  login_ip.txt  >  /var/www/g06/g06u00/public_html/testing/ip_list.txt
#cat  ../tmp/login_ip.txt
#cat  ../tmp/login_ip.txt  >>  /var/www/g06/g06u00/public_html/testing/ip_list.txt
echo '---'
echo ''


echo 'Полный список допущенных к тестированию'
cat /var/www/g06/g06u00/public_html/testing/ip_list.txt
cat  /var/www/g06/g06u00/public_html/testing/ip_list.txt >> /var/www/g06/g06u00/public_html/testing/ip_list_old.txt

