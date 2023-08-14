# ## PRG-04 Loops
# There are two types of loops in Python: the while loop and the for loop.
# The while loop runs while a condition is true. They can run indefinitely if that condition never changes. 
# If your code is stuck in an infinite loop, just press ctrl-c (or command-c on MacOS) to force quit the running code.
# The for loop runs for a predetermined number of iterations. 
# This number can be hard coded using the range() function, or dynamically assigned (using a variable, the size of a list, or the number of lines in a document). 
# It is also possible to accidentally create an infinite for loop


### Exercise 3
'''
# Create a new script.
# Copy the array below into your script.
# arr = ["Coen", "Casper", "Joshua", "Abdessamad", "Saskia"]
# Use a for loop to loop over the array. Print every name individually.
'''

# A new script with an array (arr) is added, followed by a list of names.  
arr = ["Coen", "Casper", "Joshua", "Abdessamad", "Saskia"]

# Using a for loop, every name gets printed consecutively
for x in arr:
    print(x)