#! /usr/bin/env python3

print('Content-type: text/html\n')

import MySQLdb
import cgi

string = "i211f18_mcarched" 			
password = "my+sql=i211f18_mcarched"
db_con = MySQLdb.connect(host="db.soic.indiana.edu", port = 3306, user=string, passwd=password, db=string)
cursor = db_con.cursor()

form=cgi.FieldStorage()
name=form.getfirst("name","Max")
choice=form.getfirst("choice","1")

html="""
<!doctype html>
<html>
<head><meta charset="utf-8">
<title>Results</title></head>
    <body>
	<h1> Current Votes </h1>
	<table width = "400" border=1>
	<tr><th>Mascot</th><th>Votes</th></tr>
	{content}
	</table>
    <h2>The winner is</h2>
    </body>
</html>
"""



try:
        SQL_insert="INSERT INTO Votes (Voter, Contestant) VALUES ('"+str(name)+"', '"+str(choice)+"');"
        cursor.execute(SQL_insert)
        db_con.commit()
        
        SQL = "SELECT c.Name, COUNT(v.Contestant) FROM Contestants as c, Votes as v WHERE c.ContestantID=v.Contestant;"
        cursor.execute(SQL)
        results = cursor.fetchall()
        
        
except Exception as e:
        print('<p>Something went wrong with the SQL!</p>')
        print(SQL, "\nError:", e)
else:				
        table = ""
        for row in results:
                table += "<tr>"
                for entry in row:
                    table += "<td>"+str(entry)+"</td>"
                table += "</tr>"
print(html.format(content = table))

"""
<td>Big Red II</td>
<td>394</td>


<image src="bigred.jpg">

"""
