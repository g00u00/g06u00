#!/usr/bin/env python3.4

import os,sys
import cgi, cgitb
cgitb.enable()
sys.stderr = sys.stdout

print('''\
Content-type:text/html\r\n
<html>
<head>
<title>Форма</title>
</head>
<body>
<pre>
''')
form = cgi.FieldStorage()

if "head" not in form:
    print ('''
    <form  action="message.py"   target='_self' method='post'>
    Заголовок: <input type="Text" name="head" value=""   size=8 >
    
    Сообщение: <input type="Text" name="content" value=""   size=8 >
    
    <input type="Submit" name="Submit" value="Отправить_данные_на_сервер">
    ''')

else:
    print ("Заголовок:", form["head"].value)
    print ("Сообщение:", form["content"].value)

    
    with open('../m/file.txt', mode='a', encoding="utf-8", errors=None, newline=None, closefd=True, opener=None) as f_append:
        f_append.write("%2s\n%2s\n==========\n" % (str(form["head"].value), str(form["content"].value) ))
    
    
    print("\nСчитываем данные из файла и обрабатываем")
    with open('../m/file.txt', mode='r', encoding="utf-8") as f_read:
        for line in f_read.readlines():
            print ('\n',line,end='')

print('\n</pre>\n</body>\n<html>')
