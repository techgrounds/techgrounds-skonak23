# ## PRG-04 Loops
# There are two types of loops in Python: the while loop and the for loop.
# The while loop runs while a condition is true. They can run indefinitely if that condition never changes. 
# If your code is stuck in an infinite loop, just press ctrl-c (or command-c on MacOS) to force quit the running code.
# The for loop runs for a predetermined number of iterations. 
# This number can be hard coded using the range() function, or dynamically assigned (using a variable, the size of a list, or the number of lines in a document). 
# It is also possible to accidentally create an infinite for loop


### Exercise 2
'''
# Create a new script.
# Copy the code below into your script.
# for i in range(10):
# 	# do something here
# Print the value of i in the for loop. You did not manually assign a value to i. Figure out how its value is determined.
# Add a variable x with value 5 at the top of your script.
# Using the for loop, print the value of x multiplied by the value of i, for up to 50 iterations.
'''

# new script 
# The value of 'i' is determined in line 5 by using a 'range' function (10) within the <for> Loop.  
for i in range(10):
    print(i)

# Variable "x" is added with value "5"
x = 5

# Using a for loop, the value of x multiplied by i for up to 50 iterations is printed.
for i in range(50):
    print(x * i)

