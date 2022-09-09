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
echo '<title>Список тестируемых</title>'
echo '</head>'
echo '<body>'
echo '<pre>'
echo ''
echo ''
date 
echo ""
cd  ../public_html/testing/results/t_1/
echo 'Отсортировано по времени (-lt *.txt)'
ls  -lt *.vop
echo ''
echo ''
echo 'Отсортировано по имени  - присутствие  (-ln *.txt)'
ls  -ln *.txt 
echo ''
echo ''
echo 'Отсортировано по имени - результаты (-ln *.res)'
ls  -ln *.res

