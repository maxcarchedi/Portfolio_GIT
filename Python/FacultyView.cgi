#! /usr/bin/env python3

print('Content-type: text/html\n')

import MySQLdb

string = "i211f18_mcarched" 			#change this to yours
password = "my+sql=i211f18_mcarched"	#change this to yours
db_con = MySQLdb.connect(host="db.soic.indiana.edu", port = 3306, user=string, passwd=password, db=string)
cursor = db_con.cursor()

html = """
<html>
    <head><title>Faculty Table</title></head>
    <body>
        <table border='1' width='30%'>
        <tr><th>FacultyID</th><th>Name</th><th>Title</th><th>Email</th><th>Areas</th></tr>
        {content}
        </table>
    </body>
</html>"""

try:					#Always surround .execute with a try!
        SQL = "SELECT * FROM Faculty;"
        cursor.execute(SQL)
        results = cursor.fetchall()
except Exception as e:		#Here we handle the error
        print('<p>Something went wrong with the SQL!</p>')
        print(SQL, "\nError:", e)
else:				#This runs if there was no error
        table = ""
        for row in results:
                table += "<tr>"
                for entry in row:
                    table += "<td  align='center'>" +str(entry)+ "</td>"
                table += "</tr>"
print(html.format(content = table))

