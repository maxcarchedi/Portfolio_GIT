#! /usr/bin/env python3
print('Content-type: text/html\n')

import cgi

html="""
<h1>A day in my favorite course: I211</h1>

<p>As a <em>{0}</em>, I always make sure to arrive early so I can get the best <em>{1}</em>.</p>

<p>Next to arrive is my group member, <em>{2}</em>, who goes by <em>{3}</em>, and is always telling jokes about <em>{4}</em>. Always makes me <em>{5}</em>.</p>

<p>When class begins, I <em>{6}</em> <em>{7}</em>. This shows that I'm paying attention.</p>

<p>We start to work on the first problem, and I wave my <em>{8}</em> to let the AI know I have a question. My AI tells me that a <em>{9}</em> in my code is causing an error.</p>

<p>The problems are <em>{10}</em>, but my team is <em>{11}</em> and we make it through.</p>

<p>Class ends and we all go to <em>{12}</em> to get a <em>{13}</em>... <em>{14}</em>, I just love I211!</p>"""
form=cgi.FieldStorage()

rank=form.getfirst("rank","invalid")
furniture=form.getfirst("furniture","invalid")
person=form.getfirst("person","invalid")
nickname=form.getfirst("nickname","invalid")
objects=form.getfirst("objects","invalid")
expression=form.getfirst("expression","invalid")
action=form.getfirst("action","invalid")
object1=form.getfirst("object1","invalid")
body_part=form.getfirst("body_part","invalid")
object2=form.getfirst("object2","invalid")
adj1=form.getfirst("adj1","invalid")
adj2=form.getfirst("adj2", "invalid")
place=form.getfirst("place","invalid")
drink=form.getfirst("drink","invalid")
exclamation=form.getfirst("exclamation","invalid")

print(html.format(rank,furniture,person,nickname,objects,expression,action,object1,body_part,object2, adj1, adj2, place, drink,exclamation))
