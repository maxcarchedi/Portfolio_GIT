#! /usr/bin/env python

import cgi

print('Content-type: text/html\n')


highcards={"J":11,"Q":12,"K":13,"A":14}
win_rank="10"
win_suit="C"
card=str(win_rank + win_suit)

form=cgi.FieldStorage()
rank=form.getfirst("rank","A")
suit=form.getfirst("suit","C")
guessedcard=str(rank+suit)

html="""
<html>
    <body>
        <table>
            <tr><td><h1>You guessed:</h1><img src="cards/{guessedcard}.jpg"></td></tr>
            <tr><td><h1>Suit:</h1>{suit_status}</td></tr>
            <tr><td><h1>Rank:</h1>{rank_status}</td></tr>
        </table>
    </body>
</html>"""
rank_stat=""
suit_stat=""
win_stat=""

if card == guessedcard:
    rank_stat="Correct Rank"
    suit_stat="Correct Suit"
    win_stat="1"
else:
    if rank in highcards.keys():
        if highcards[rank] < int(win_rank):
            rank_stat="Too Low"
        elif highcards[rank] > int(win_rank):
            rank_stat="Too High"
        else:
            rank_stat="Error"
    else:
        if int(rank) < int(win_rank):
            rank_stat="Too Low"
        elif int(rank) > int(win_rank):
            rank_stat="Too High"
        else:
            rank_stat="Error"

    if win_suit == suit:
        suit_stat="Correct Suit"
    else:
        suit_stat="Wrong Suit"

print(html.format(guessedcard=guessedcard, suit_status=suit_stat, rank_status=rank_stat))
    
html_repost="""
<!doctype html>
<html>
<head><meta charset="utf-8">
<title>Guess My Card</title>
</head>

<body>

<form method="post" action="guessmycard.cgi">
	<H2>Try to guess the card!</H2>
	<p>Rank:
		<select name="rank">
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
			<option>J</option>
			<option>Q</option>
			<option>K</option>
			<option>A</option>
		</select>
	</p>
	<p>Suit:
		<br /><input type="radio" name="suit" value="C" checked />Clubs
		<br /><input type="radio" name="suit" value="D" />Diamonds
		<br /><input type="radio" name="suit" value="H" />Hearts
		<br /><input type="radio" name="suit" value="S" />Spades
	</p>
	<button type="submit">Submit</button>
</form>

</body>
</html>
"""
if win_stat=="1":
    print("YOU WIN!")
else:
    print("TRY AGAIN!")
    print(html_repost)

