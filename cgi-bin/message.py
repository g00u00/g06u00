#!/usr/bin/env python3.4

import os,sys
import cgi, cgitb
import datetime
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

if "head" in form and "content" in form and (form["id"].value) == "a":
    print ("Заголовок:", form["head"].value)
    print ("Сообщение:", form["content"].value)
    print ("ID:", form["id"].value)
    with open('../m/file.txt', mode='a', encoding="utf-8", errors=None, newline=None, closefd=True, opener=None) as f_append:
        f_append.write("%2s\n%2s\n%2s\n%2s\n==========\n" % (str(datetime.datetime.now()), str(form["head"].value), str(form["content"].value), str(form["id"].value) ))
print ('''
<form  action="message.py"   target='_self' method='post'>
Заголовок: <input type="Text" name="head" value=""   size=8 >
Сообщение: <input type="Text" name="content" value=""   size=8 >
ID: <input type="Text" name="id" value="a"   size=8 >(a,r)
<input type="Submit" name="Submit" value="Отправить">
''')

if "id" in form and (form["id"].value) == "r":    
    print("\nДанные из файла")
    with open('../m/file.txt', mode='r', encoding="utf-8") as f_read:
        for line in f_read.readlines():
            print ('\n',line,end='')
else:
    print("\n")
print('\n</pre>\n</body>\n<html>')
