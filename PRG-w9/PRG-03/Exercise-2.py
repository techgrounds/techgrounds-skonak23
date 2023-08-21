### PRG-03 Data types and comments
### Programming languages make use of data types to tell the computer how to interpret those strings.
### 
### This is a non-exhaustive list of some of the most important data types in Python:
# boolean
# A binary state that is either True or False.
# boolean = True
# string
# Technically an array of characters. Strings are denoted using “ ” double quotes or ‘ ’ single quotes.
# string = "This is a string"
# int
# An integer is a whole number. Ints can be both positive and negative.
# integer = 6
# float
# A floating-point number is a decimal number.

### Exercise 2 : 
"""
Create a new script.
Use the input() function to get input from the user. Store that input in a variable.
Find out what data type the output of input() is. See if it is different for different kinds of input (numbers, words, etc.).
"""


# a variable is created and dependant on input from the user
name = input("Enter a name ")
number = input("Enter a number ")


# Datatype of user input is determined
data_type1 = type(name)
data_type2 = type(number)

# Print data type 
print("Data type of user input: ", data_type1)
print("Data type of user input: ", data_type2)

# Conclusion -> output from an input() function will always return as a string regardless of content. So doesn't matter whether you enter a number or word.

