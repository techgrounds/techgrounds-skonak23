### PRG-06 Functions
# A function is a block of code that only runs when it is called. 
# Functions are recognizable by the brackets () next to the function name. 
# These brackets serve as a place to input data into a function.
# Functions return data as a result.
# Besides the built-in functions, you can also write custom functions, or import functions from a library or package


# Exercise 1:

"""
# Create a new script.
# Import the random package.
# Print 5 random integers with a value between 0 and 100.
"""


import random

for x in range(5):
    
    print(random.randint(0,100))
    