#!/usr/bin/python
# -*- coding: utf-8 -*- 

import cgi
import subprocess

print "Content-type:text/txt\r\n\r\n"
#print "Content-type:text/html\r\n\r\n"


print "abc_абв"

subprocess.call(['ls', '-la'])
