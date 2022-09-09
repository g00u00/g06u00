#!/usr/bin/python
# -*- coding: utf-8 -*- 

import os
import cgi, cgitb 


#print "Content-type:text/txt\r\n\r\n"
print "Content-type:text/html\r\n\r\n"

print '''\
<!DOCTYPE html>
<html>
<pre>
Содержание домашнего раздела
'''
my_home="../"
for (path, dirs, files) in os.walk(my_home):
    print path
    for file in files:
        print file

print '''\
</pre>
</html>
'''