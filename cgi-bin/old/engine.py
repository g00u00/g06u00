#!/usr/bin/python
# -*- coding: utf-8 -*- 

import os
import cgi, cgitb 


form = cgi.FieldStorage() 
#info_file='../public_html/page_1/info.htm'
info_file = form.getvalue('info_file')
print "Content-type:text/html\r\n\r\n"
print '''<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/engine.css">
<title>Заголовок страницы</title> 
</head>

<body>
<div>

<div  class="hellobox">
<h1>'''        
f = open('../public_html/hello/info.htm', 'r')
for line in f:  print line,
f.close()        
print '''
</h1>
</div>

<nav>
<ul>'''
f = open('../public_html/navigation/info.htm', 'r')
for line in f:  print line,
f.close()
print '''
</ul>
</nav>
'''
    
print '''<section>'''
f = open(info_file, 'r')
for line in f:  print line,
f.close()
print '''</section>
'''

print '''<footer>'''    
f = open('../public_html/footer/info.htm', 'r')
for line in f:  print line,
f.close()
print '''
</footer>
'''
print '''
</div>
</body>
</html>
'''
'''
/cgi-bin/engine.py?info_file=../public_html/page_1/info.htm
Сделать:
- информационный фрагмент задавать названием папки (не относительнм адресом)
- двухуровневую навигацию
- выделить через CSS открытые ссылки
- сделать уникальными метатэгии и title для каждой страницы
'''