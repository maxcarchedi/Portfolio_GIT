#! /usr/bin/env python3

print('Content-type: text/html\n')

import MySQLdb
import cgi

string = "i211f18_mcarched" 			
password = "my+sql=i211f18_mcarched"	
db_con = MySQLdb.connect(host="db.soic.indiana.edu", port = 3306, user=string, passwd=password, db=string)
cursor = db_con.cursor()

form=cgi.FieldStorage()
name=form.getfirst("Name","N/A")
title=form.getfirst("Title","N/A")
email=form.getfirst("Email","N/A")
area=form.getfirst("Areas","N/A")


html = """
<html>
    <head><title>Faculty Table</title></head>
    <body>
        <a href="http://cgi.soic.indiana.edu/~mcarched/FacultyAdd.html">Go Back</a>
        <h2>New Faculty Member Added</h2>
        <table border='1' width='30%'>
        <tr><th>FacultyID</th><th>Name</th><th>Title</th><th>Email</th><th>Areas</th><th>Delete</th><th>Edit</th></tr>
        {content}
        </table>
    </body>
</html>"""

try:					
        SQL = "INSERT INTO Faculty (Name, Title, Email, Areas)"
        SQL +=" VALUES('" + name + "','" + title + "','" + email + "','" + area + "');"
        cursor.execute(SQL)
        db_con.commit()


        SQL_Select="SELECT * FROM Faculty;"
        cursor.execute(SQL_Select)
        results = cursor.fetchall()
        
except Exception as e:		
        print('<p>Something went wrong with the SQL!</p>')
        print(SQL, "\nError:", e)
else:
        table = ""
        for row in results:
                table+="<tr>"
                for item in row:
                        table += "<td align='center'>"+str(item)+"</td>"
                table += "<td align='center'><a href='FacultyDelete.cgi?fid="+str(row[0])+"'>Delete</a></td>"
                table +="<td align='center'><a href='FacultyEdit.cgi?fid="+str(row[0])+"'>Edit</a></td>"
                table+="</tr>"              
print(html.format(content = table))

