#!/usr/bin/python3

import cgi
import subprocess
print("Content-Type: text/html\n")
form = cgi.FieldStorage(environ={'REQUEST_METHOD':'POST'})
fname = form.getvalue("fname")
lname = form.getvalue("lname")
email = form.getvalue("email")
subject = form.getvalue("subject")
message = form.getvalue("message")
mail = [ 'mail', '-s', subject, '-r', email, '--', 'joebert@kenchlightyear.com']
body = [ 'echo', 'Message from: ' + fname + ' ' + lname + ' ' + message ]
bodyproc = subprocess.Popen(body, stdout=subprocess.PIPE)
mailproc = subprocess.Popen(mail, stdin=bodyproc.stdout)
print("Thank you for contacting us. We have received your message. We will get back to you soon.")
print('<p><a href="javascript:self.close()">Close</a></p>')
