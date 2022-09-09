#!/usr/bin/python
# -*- coding: utf-8 -*- 

import cgi
import os.path

print "Content-type:text/txt\r\n\r\n"
#print "Content-type:text/html\r\n\r\n"

print os.path.abspath('./')
print os.curdir
print os.stat('./')
print os.path.exists('./')


print os.path.isdir('./')
print os.path.getsize('./')
print os.path.isfile('./os.path.py')
print os.path.getsize('./os.path.py')

print os.path.expanduser("~/")
print os.path.expandvars("${PATH}")

my_home=os.path.abspath('../')
print my_home

tmp_path="a/b/c/d"
print os.path.split(tmp_path)
print os.path.dirname(tmp_path)
print os.path.basename(tmp_path)
print os.path.join(my_home, tmp_path)


'''
Пользователь
Дата
Содержание скрипта
Результат выполнения
-------------------------------------
Показать содержание домашнего раздела
Содержание папок первого уровня
В каждой папке добавить по папке с префиксом типа g05u00_
Показать содержание каждой папки второго уровня
Удалить созданные папки
Показать содержание папок первого уровня
'''