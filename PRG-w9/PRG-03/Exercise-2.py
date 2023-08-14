# a variable is created and dependant on input from the user
name = input("Enter a name")
number = input("Enter a number")


# Datatype of user input is determined
data_type1 = type(name)
data_type2 = type(number)

# Print data type 
print("Data type of user input: ", data_type1)
print("Data type of user input: ", data_type2)

# Conclusion -> output from an input() function will always return as a string regardless of content. So doesn't matter whether you enter a number or word.

