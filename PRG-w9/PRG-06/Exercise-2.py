### PRG-06 Functions
# A function is a block of code that only runs when it is called. 
# Functions are recognizable by the brackets () next to the function name. 
# These brackets serve as a place to input data into a function.
# Functions return data as a result.
# Besides the built-in functions, you can also write custom functions, or import functions from a library or package


# Exercise 2:

"""
# Create a new script.
# Write a custom function myfunction() that prints “Hello, world!” to the terminal. Call myfunction.
# Rewrite your function so that it takes a string as an argument. Then, it should print “Hello, <string>!”.

"""







def myfunction(name):
    print("Hello " + name)

name = input("Hello what is your name? ")

myfunction(name)

