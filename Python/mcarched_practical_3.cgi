#! /usr/bin/env python

import cgi

print('Content-type: text/html\n')
dic={"a":"Ackbar","b":"Bossk","c":"Chewie and C-3P0","d":"Dasg Rendar","e":"Ewoks","f":"Fett","g":"Greedo","h":"Han Solo","i":"IG-88","j":"Jabba","k":"Kyle Katarn","l":"Luke and Leia","m":"Mara Jade","n":"Nien Numb","o":"Obi-Wan","p":"Palpatine","q":"Quinlan Vos","r":"R2D2","s":"Stormtroopers","t":"Thrawn","u":"Ulic Qel-droma","v":"Vader","w":"Wedge","x":"Xizor","y":"Yoda","z":"Zuckuss"}

form=cgi.FieldStorage()
letter_choice=form.getfirst("letter","a")
textentry=form.getfirst("guess","N/A")

html="""
<!doctype html>
<html>
<head><meta charset="utf-8">
<title>Alphabet Practice</title></head>
    <body>
        <img src="vrtpr/{image}.jpg">
	<h2>{status}</h2>
	<form method="post" action="mcarched_practical_3.cgi">
            <p>The letter:
            <select name="letter">
                <option>a</option>
                <option>b</option>
                <option>c</option>
                <option>d</option>
                <option>e</option>
                <option>f</option>
                <option>g</option>
                <option>h</option>
                <option>i</option>
                <option>j</option>
                <option>k</option>
                <option>l</option>
                <option>m</option>
                <option>n</option>
                <option>o</option>
                <option>p</option>
                <option>q</option>
                <option>r</option>
                <option>s</option>
                <option>t</option>
                <option>u</option>
                <option>v</option>
                <option>w</option>
                <option>x</option>
                <option>y</option>
                <option>z</option>
            </select>
            </p>
            <p>Is for: <input type="text" name="guess"></p>
        <button type="submit">Submit</button>
    </form> 
</body>
</html>"""
stat=""

if textentry.lower() == dic[letter_choice].lower():
    stat="That is Correct"
    win_stat=1
elif textentry.lower() == "n/a":
    stat="Please enter in the value for the letter you chose"
else:
    stat="Sorry, the correct response was " + str(dic[letter_choice])

print(html.format(image=letter_choice, status=stat))
