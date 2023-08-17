# ## PRG-05 Conditions
# Very often, you will want to run a piece of code only when certain conditions are met.
# For example, you might want to write something to an error log only if the reply you receive from a server contains an error.
# Python makes use of the if, elif, and else statements.


### Exercise 1 : 
"""
Create a new script.
Use the input() function to ask the user of your script for their name. 
If the name they input is your name, print a personalized welcome message. If not, print a different personalized message.
"""

user_name = input("Enter a name ")

your_name = "sinan"

if user_name == your_name:
    print("Hello Sinan")
else:
    print("wrong person detected")
