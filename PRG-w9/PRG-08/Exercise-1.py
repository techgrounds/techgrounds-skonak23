### PRG-08 Key-value pairs
# Key-value pairs are a general concept you will definitely encounter. Some examples of where you will find them are NoSQL databases or AWS/Azure resource tags. 
# Dictionaries (dict) in Python also use key-value pairs to store information.

# Dicts in Python are written using curly brackets {}. You can get values from the dict by calling its key. 



# Exercise 1:

# Key                     Value

# First name              Casper    
# Last name               Velzen   
# Job title               Learning coach
# Company                 Techgrounds

"""
# Create a new script.
# Loop over the dictionary and print every key-value pair in the terminal.

"""

# A Dict is created here with Keys and their respective values
woordenboek = {
"First name": "Casper",
"Last name": "Velzen",
"Job title": "Learning coach",
"Company": "Techgrounds"
}

# A 'for loop' 
for x, y in woordenboek.items():
    print(x, y)
    
