#Massimo Carchedi
#Practical 2

import urllib.request
import re
import ssl
import webbrowser

#Section 1
#opens the website
url="https://www.indiana.edu/news-events/index.html"
context = ssl._create_unverified_context()
#url request webpage
web_page = urllib.request.urlopen(url,context=context)
#puts contents of site into string minus errors
contents = web_page.read().decode(errors="replace")
web_page.close()

#Section 2
print("Searching:",url,"\n")
#gathers all headings on the site via the span tag with a itemprop="headline"
headers=re.findall('(?<=<span itemprop="headline">).+?(?=</span>)',contents, re.DOTALL)
#prints list of headers gathered
for item in headers:
    print(item,"\n")

#spacer
print("-"*30)

#Section 3
#asks user for a keyword to search
search=input("Please enter a word to search: ")
#spacer
print("-"*30)

#Sees if each header has the keyword the user asked for in it. if it does then print the headline.
for item in headers:
    if search.lower() in item.lower():
        print(item,"\n")
#Section 4 - Bonus
webbrowser.open("https://news.iu.edu/stories/2017/10/iub/03-science-drosophila-facilities.html")
webbrowser.open_new_tab("https://news.iu.edu/stories/2017/09/iub/releases/28-kelley-habitat-whirlpool-campus-build.html")

    
