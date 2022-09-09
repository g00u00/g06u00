#!/usr/bin/python
# -*- coding: utf-8 -*- 

import cgi

print "Content-type:text/txt\r\n\r\n"
#print "Content-type:text/html\r\n\r\n"


print "абв"

FR = open ("040_rwrite.py", "rt")#функция возвращает дескриптор файла
FW = open ("040_rwrite.txt", "wt+")#функция возвращает дескриптор файла

for Line in FR: # дескриптор  FR содержит внути себя иттератор, объект генератор содержит внути себя генератор -функцию
#    print Line,
    print Line[:-1]
    FW.write(Line)
FR.close()

FR = open ("040_rwrite.py", "rt")#функция возвращает дескриптор файла
L=FR.readline()
L=FR.read(5)
for Line in FR: # дескриптор  FR содержит внути себя иттератор, объект генератор содержит внути себя генератор -функцию
    L = Line[:-1] if Line[:-1]=="\n\r" else Line # условное выражение
    print L
FR.close()    
FW.close()

print "with ..."
with open("040_rwrite.py") as f:
    for line in f:
        print line,


#Синтаксический анализ регулярные выражения конечный автомат
