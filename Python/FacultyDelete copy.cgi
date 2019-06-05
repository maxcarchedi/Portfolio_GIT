#! /usr/bin/env python3

print('Content-type: text/html\n')

import MySQLdb
import cgi

string = "i211f18_mcarched" 			
password = "my+sql=i211f18_mcarched"	
db_con = MySQLdb.connect(host="db.soic.indiana.edu", port = 3306, user=string, passwd=password, db=string)
cursor = db_con.cursor()

form = cgi.FieldStorage()
fid = form.getfirst("fid", "0")

SQL = "DELETE FROM Faculty WHERE FacultyID = " + fid + ";"
cursor.execute(SQL)
db_con.commit()

html="""
</html>
    <head>
        <title>Deleted</title>
    </head>
    <body>
        <p>Success</p>
        <a href='FacultyAdd.cgi'>Go back</a>
    </body>
</html>"""
print(html)
