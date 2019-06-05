import cgi

#! /usr/bin/env python3
print('Content-type: text/html\n')

form=cgi.FieldStorage()

html="""<html>
	<head>
		<meta charset="utf-8">
		<title>Form in CGI</title>
	</head>
	<body>
		<form action="name.cgi" method="post">
			Please enter your name: 
			<input type="text" name="username"><br>
			<button type="submit">Submit</button>
		</form> 
	</body>
</html>"""

user=form.getfirst('username'.'Who are you?')
print(html.format(content = "Hello" + user))
