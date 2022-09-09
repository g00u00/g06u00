#!/usr/bin/env python2
# -*- coding: utf-8 -*-

'''\
AddDefaultCharset utf-8
SetEnv PYTHONIOENCODING utf-8
'''


import sys, cgi, cgitb


print ("Content-type:text/html\r\n\r\n")

print ('''\
<!DOCTYPE HTML>
''')

print("<pre>")
print (sys.version_info)

print (bin(0b00110001))
print (int(0b00110001))
print (oct(0b00110001))
print (hex(0b00110001))
print (chr(0b00110001))
print (bin(0b00110001))

print ('B')
print (ord('B'))
cyr="Г"
print (cyr)
print (ord(cyr))
print (chr(ord(cyr)))
print (ord(cyr)+2)
print (chr(ord(cyr)+2))

str="aaa_ббб"
print (str)

print("</pre>")

