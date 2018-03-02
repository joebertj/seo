#!/home/kenchlig/bin/python3.5

import cgi
import subprocess
print("Content-Type: text/html\n")
form = cgi.FieldStorage(environ={'REQUEST_METHOD':'POST'})
email = form.getvalue("email")
cmd = ['mail', '-s', 'Resume of Joebert Jacaba', '-a', '/home/kenchlig/ex.kenchlightyear.com/resume.doc', email]
filename = "/home/kenchlig/ex.kenchlightyear.com/body"
file = open(filename, "r")
p = subprocess.Popen(cmd, stdin=file)
print("Your email has been delivered. It should arrive shortly.")
print('<p><a href="/">Go back</a></p>')
