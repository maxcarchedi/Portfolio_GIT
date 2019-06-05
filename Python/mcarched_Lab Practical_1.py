#Massimo Carchedi
#mcarched
#Lecture Group 11
#lab practical 1


#section 2
#takes the passwords file and puts each line into a list. The list contains all the passwords in the file passwords.txt
passwords=[line.strip() for line in open("passwords.txt","r")]

#section 3
#tried to do the output.format() function to print 5 passwords per line. but couldnt get it to work properly
output="{} {} {} {} {}"
def show_list(lst):
    print("The current possible passwords are:\n")
    print("-"*30)
    
    #tried to do the output.format() here
    for item in lst:
        print(item)
    #prints number of passwords possible
    print("\n("+str(len(lst))+" possible)\n")

#section 4
#prints the original list from the file passwords.txt
show_list(passwords)

#list comprehenshion for clue 1 to fin if the length is at least 6.
clue1=[item for item in passwords if len(item)>=6]
print("Clue 1: The password is at least 6 characters long.\n")
show_list(clue1)

#list comprehenshion for clue 2 to narrow down clue 1 to passwords with at least 1 letter.
clue2=[item for item in clue1 if len([let for let in item if let.isalpha()])>0]
print("Clue 2: The password contains at least 1 letter.\n")
show_list(clue2)

#list comprehenshion for clue 3 to narrow down clue 2 to passwords with no vowel for the first character and a vowel for the second character.
clue3=[item for item in clue2 if item[0].lower() in "qwrtypsdfghjklzxcvbnm" and item[1].lower() in "aeiou"]
print("Clue 3: The password does not start with a vowel, but the second character is a vowel.\n")
show_list(clue3)

#list comprehenshion for clue 4 to see if the password has at least twice as man consonants as vowels
clue4=[item for item in clue3 if len([let for let in item if let in "qwrtypsdfghjklzxcvbnm"])>=2*len([let for let in item if let in "aeiou"])]
print("Clue 4: The password has at least twice as many consonants as vowels.\n")
show_list(clue4)

#Bonus
#list comprehenshion for clue 5 to see if all the vowels are in alphabetical order
clue5=[item for item in clue4 if [let.lower() for let in item if let in "aeiou"]==["a","o"]]
print("Clue 5: The password has all of its vowels in alphabetical order.\n")
show_list(clue5)
print("Password Found!\n")

