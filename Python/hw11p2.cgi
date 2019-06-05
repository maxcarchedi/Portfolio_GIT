#! /usr/bin/env python3

print('Content-type: text/html\n')

import MySQLdb
import cgi

string = "i211f18_mcarched" 			
password = "my+sql=i211f18_mcarched"
db_con = MySQLdb.connect(host="db.soic.indiana.edu", port = 3306, user=string, passwd=password, db=string)
cursor = db_con.cursor()

form=cgi.FieldStorage()
item=form.getfirst("item","laptop")
cost=form.getfirst("cost","10")
delivery_method=form.getfirst("delivery_method","drone")

total_cost=0
shipping_cost=0

if delivery_method=="drone":
    shipping_cost+=10
elif delivery_method=="self driving car":
    shipping_cost+=20
elif delivery_method=="giant robot":
    shipping_cost+=1000

total_cost=int(shipping_cost)+int(cost)

html = """
<!doctype html>
<html>
<head><meta charset="utf-8">
<title>Robot Delivery System Confirmation</title></head>
    <body>
    <h1>Robot Delivery System Confirmation</h1>
    <p>You have selected to have a {} delivered by {}.</p>
<p>Your total comes to ${}</p>
<h2>Delivery Records</h2>
<table border="1">
<tr><th>DeliveryID</th><th>Item</th><th>Cost</th><th>Method</th><th>Shipping</th></tr>
{}
</table>"""

try:
        SQL="INSERT INTO Deliveries (Item, Cost, Method, Shipping) "
        SQL+="VALUES ('"+str(item)+"', "+str(cost)+", '"+str(delivery_method)+"', "+str(shipping_cost)+");"
        cursor.execute(SQL)
        db_con.commit()

        SQL_Select="SELECT * FROM Deliveries;"
        cursor.execute(SQL_Select)
        results = cursor.fetchall()
        
        
except Exception as e:		#Here we handle the error
        print('<p>Something went wrong with the SQL!</p>')
        print(SQL, "\nError:", e)
else:				#This runs if there was no error
        table = ""
        for row in results:
                table += "<tr>"
                for entry in row:
                    table += "<td>"+str(entry)+"</td>"
                table += "</tr>"
print(html.format(item, delivery_method, total_cost, table))
