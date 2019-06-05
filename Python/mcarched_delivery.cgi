#! /usr/bin/env python3
print('Content-type: text/html\n')

import cgi

html="""<!doctype html>
<html>
<head><meta charset="utf-8">
<title>Robot Delivery System Confirmation</title></head>
    <body>
    <h1>Robot Delivery System Confirmation</h1>
    <p>You have selected to have a {0} delivered by {1}.</p>
<p>Your total comes to ${2}</p>
    </body>
</html>"""

form=cgi.FieldStorage()
deliverymethod= form.getfirst("delivery_method","INVALID")
cost= form.getfirst("cost","INVALID")
item= form.getfirst("delivery","INVALID")
total=""


if deliverymethod == "drone":
    total= int(cost) + 10
elif deliverymethod == "self driving car":
    total= int(cost) + 20
elif deliverymethod == "giant robot":
    total= int(cost) + 1000
else:
	total= 0

print(html.format(item, deliverymethod, total))
