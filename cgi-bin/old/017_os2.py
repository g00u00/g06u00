#!/usr/bin/python
# -*- coding: utf-8 -*- 

import cgi
import os

print "Content-type:text/txt\r\n\r\n"
#print "Content-type:text/html\r\n\r\n"

print os.name
print os.uname()
print os.environ

print os.getcwd()
print os.listdir('./')

my_cwd=os.getcwd()

os.chdir("../")
print os.getcwd()
print os.listdir('./')

os.chdir("/")
print os.getcwd()
print os.listdir('./')

os.chdir(my_cwd)
print os.getcwd()
print os.listdir('./')

#os.mkdir('os_mkdir' , 666)
print os.listdir('./')


print os.getenv("${REMOTE_ADDR}")
#os.fdopen('fd', 'w')
#os.write('fd', 'str')
#os.close("fd")

print os.access("engine.py", os.R_OK)

print os.system('who')

print os.name