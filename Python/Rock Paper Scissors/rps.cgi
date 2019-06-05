#! /usr/bin/env python3
print('Content-type: text/html\n')

import cgi, random

html="""<!doctype html>
<html>
<head><meta charset="utf-8">
<title>Rock Paper Scissors</title></head>
    <body>
        <p>You chose: {user} {userimage}</p>
        <p>Computer chose: {computer} {computerimage}</p>
	<h2>{status}</h2>
    </body>
</html>"""

form=cgi.FieldStorage()
userguess= form.getfirst("symbol","Rock")

choiceList = ["Rock", "Paper", "Scissors"]

bot_choose_random = random.SystemRandom()
bot_choice = bot_choose_random.choice(choiceList)

image1=""
image2=""

if bot_choice == 'Rock':
    choice_num_bot = 1
    image1="<img src='Rock-icon.png' width='300px'>"
elif bot_choice == 'Paper':
    choice_num_bot = 2
    image1="<img src='paper.svg' width='300px'>"
elif bot_choice == 'Scissors':
    choice_num_bot = 3
    image1="<img src='scissors-icon.png' width='300px'>"
    
if userguess == 'Rock':
    userguess_num = 1
    image2="<img src='Rock-icon.png' width='300px'>"
elif userguess == 'Paper':
    userguess_num = 2
    image2="<img src='paper.svg' width='300px'>"
elif userguess == 'Scissors':
    userguess_num = 3
    image2="<img src='scissors-icon.png' width='300px'>"

if userguess_num == choice_num_bot:
    message="You Tied!"
elif (userguess_num == 1 and choice_num_bot == 3) or (userguess_num == 2 and choice_num_bot == 1) or (userguess_num == 3 and choice_num_bot == 2):
    message="You won!"
else:
    message="You lost!"

print(html.format(user=userguess, computer=bot_choice, status=message,computerimage=image1, userimage=image2))
