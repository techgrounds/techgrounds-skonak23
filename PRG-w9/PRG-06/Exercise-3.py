### PRG-06 Functions
# A function is a block of code that only runs when it is called. 
# Functions are recognizable by the brackets () next to the function name. 
# These brackets serve as a place to input data into a function.
# Functions return data as a result.
# Besides the built-in functions, you can also write custom functions, or import functions from a library or package


# Exercise 3:

"""
# Create a new script.
Copy the code below into your script.
    def avg():
	    # write your code here

# you are not allowed to edit any code below here
    x = 128
    y = 255
    z = avg(x,y)
print("The average of",x,"and",y,"is",z)
Write the custom function avg() so that it returns the average of the given parameters. You are not allowed to edit any code below the second comment.

"""
def avg(x,y):
	# write your code here
    return ((x + y)/2)

# you are not allowed to edit any code below here
x = 128
y = 255
z = avg(x,y)
print("The average of",x,"and",y,"is",z)



