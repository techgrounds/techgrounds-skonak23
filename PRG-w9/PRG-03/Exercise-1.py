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

### Exercise 1 : 
"""
Create a new script.
Copy the code below into your script.
a = 'int'
b = 7
c = False
d = "18.5"
Determine the data types of all four variables (a, b, c, d) using a built in function.
Make a new variable x and give it the value b + d. Print the value of x. This will raise an error. Fix it so that print(x) prints a float.
"""



# Variables are stated below
a = 'int'
b = 7
c = False
d = "18.5"

# Data type of each variable determined by using <(type())>
print(type(a))
print(type(b))
print(type(c))
print(type(d))

# Datatype of var "d" is converted from string to float with 'float()'  
d = float(d)

# A new variable "x" is created and its value is equal to var(b) + var(d) 
x = b + d

# Value of "x" printed
print(x)
