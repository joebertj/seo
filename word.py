#!/home/kenchlig/bin/python3.5

import cgi
print("Content-Type: text/html\n")
form = cgi.FieldStorage()
drow = form.getvalue("word").lower()
lendrow=len(drow)
ldrow=list(drow)
words=open("/home/kenchlig/words","r")
print("<ul>")
for word in words:
   if(lendrow==len(word)-1):
      lword=list(word)
      lword=lword[:-1]
      if(set(ldrow)==set(lword)):
         print("<li>")
         print(word.upper())
         print("</li>")
words.close()
print("</ul>")

