#!/usr/bin/python
## -*- coding: utf-8 -*-

print "Content-type:text/txt\r\n\r\n"
#print "Content-type:text/html\r\n\r\n"

import sys

print sys.version_info
#список для  привязки к сторонним библиотекам
for P in sys.argv:
    print P

sys.exit(0) #код завершения
