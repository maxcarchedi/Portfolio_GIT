#! /usr/bin/env python3
print('Content-type: text/html\n') #necessary for it to work!

text = """<!doctype html><html><head><meta charset="utf-8">
    <title>First CGI</title></head>
    <body><h1>Hello World!</h1></body></html>"""

print(text)
