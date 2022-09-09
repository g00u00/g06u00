#!/usr/bin/python3


import cgi
import os, os.path

#print ("Content-type:text/txt\r\n\r\n")
print ("Content-type:text/html\r\n\r\n")

my_string="абв"
print (my_string)

for k in my_string:
    print (ord(k),k)

'''
Пользователь
Дата
Содержание скрипта
Результат выполнения
-------------------------------------

'''
