#!/usr/bin/python
# -*- coding: utf-8 -*- 

import os
import cgi, cgitb 
import csv
import hashlib

print "Content-type:text/txt\r\n\r\n"
#print "Content-type:text/html\r\n\r\n"


print "абв"

with open('./060_csv.txt', 'wt') as d_file:
    fieldnames = ['first_name', 'last_name']
    writer = csv.DictWriter(d_file, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerow({'first_name': 'Baked', 'last_name': 'Beans'})
    writer.writerow({'first_name': 'Lovely', 'last_name': 'Spam'})
    writer.writerow({'first_name': 'Wonderful', 'last_name': 'Spam'})


with open('./060_csv.txt', 'at') as d_file:
    d_wr=csv.writer(d_file)
    d_wr.writerow(["a",100])
    d_wr.writerow(["вг",200])

with open('./060_csv.txt', 'rt') as d_file:
    d_read=csv.reader(d_file)
    for row in d_read:
        print row
        print ', '.join(row)
        print row[0], ",, ", row[1]
        
print csv.field_size_limit()
print csv.list_dialects()
    
    
    
HS=hashlib.md5()
with open('./060_csv.txt','rb',1024) as d_file :
    try:
        while True:
            A = d_file.read()
            if A == '' : break
            HS.update(A)
    except IOError: pass
print HS.hexdigest()
print HS.digest_size
print HS.block_size
