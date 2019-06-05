#! /usr/bin/env python3

print('Content-type: text/html\n')

import MySQLdb
import cgi

string = "i211f18_mcarched" 			
password = "my+sql=i211f18_mcarched"
db_con = MySQLdb.connect(host="db.soic.indiana.edu", port = 3306, user=string, passwd=password, db=string)
cursor = db_con.cursor()

html="""
<!doctype html>
<html>
<head><meta charset="utf-8">
<title>Vote!</title></head>
    <body>
	<h1> Vote for the next SICE msacot now </h1>
	<form action="RecordVote.cgi" method="post">
	<p><strong>Name : </strong><input type="text" name="name"></p>
	{content}
	<input type="submit" value="Submit Vote">
	</form>
    </body>
</html>
"""
try:
        SQL = "SELECT ContestantID, Name, Description FROM Contestants;"
        cursor.execute(SQL)
        results = cursor.fetchall()
        
except Exception as e:
        print('<p>Something went wrong with the SQL!</p>')
        print(SQL, "\nError:", e)
else:
        table = ""
        for row in results:
            table += "<p><input type='radio' name='choice' value='"+str(row[0])+"' /> <strong>"+str(row[1])+"</strong> : "+str(row[2])+"<p>"
print(html.format(content = table))

"""
<p><input type="radio" name="choice" value="1" /> <strong>Big Red II</strong> : Super computer at IU, just super isn't it<p>
<p><input type="radio" name="choice" value="2" /> <strong>Scyther</strong> : Pokemen with a reasonably apt name<p>
<p><input type="radio" name="choice" value="3" /> <strong>A Rock With Googly Eyes</strong> : In the era of Boaty McBoatface, this might just be the mascot of our times<p>
<p><input type="radio" name="choice" value="4" /> <strong>The Rock With Googly Eyes</strong> : Surprisingly strong alternate contender<p>
"""
