# ## PRG-05 Conditions
# Very often, you will want to run a piece of code only when certain conditions are met.
# For example, you might want to write something to an error log only if the reply you receive from a server contains an error.
# Python makes use of the if, elif, and else statements.



### Exercise 2 : 
"""
Create a new script.
Ask the user of your script for a number. Give them a response based on whether the number is higher than, lower than, or equal to 100.
"""


correct_number = 100

while True:
    
    number = int(input("Enter a number "))

    if number == correct_number:
        print("good guess!")
        break
    elif number > 100:
        print("number is too high")
    elif number < 100:
        print("number is too low")





"""
In this exercise a number guessing game is set
Untill the correct number is inserted (100), the loop will repeatedly ask the user to insert a number.
If the number is lower than 100, "number is too low" will be printed. Same goes for a number that's higher. 

"""