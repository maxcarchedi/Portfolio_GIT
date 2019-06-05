#! /usr/bin/env python3

import urllib.request
import re

print('Content-type: text/html\n')

data = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]

html = """<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Hello</title>
</head>
<body>
	<table border=1>
            {content}
	</table>
</body>
</html>"""

table = ""
for sublist in data:
    table += "<tr>"
    for elem in sublist:
        table += "<td>" + str(elem) + "</td>"
    table += "</tr>"


print(html.format(content=table))
