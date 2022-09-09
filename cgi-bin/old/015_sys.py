#!/usr/bin/python3


import cgi


print ("Content-type:text/html\r\n\r\n")
print("<pre>")

print (sys.version_info)
#список для  привязки к сторонним библиотекам
for P in sys.argv:
    print (P)

print("</pre>")

sys.exit(0) #код завершения
