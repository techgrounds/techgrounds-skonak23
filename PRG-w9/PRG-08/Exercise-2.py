### PRG-08 Key-value pairs
# Key-value pairs are a general concept you will definitely encounter. Some examples of where you will find them are NoSQL databases or AWS/Azure resource tags. 
# Dictionaries (dict) in Python also use key-value pairs to store information.

# Dicts in Python are written using curly brackets {}. You can get values from the dict by calling its key. 



# Exercise 2:

# Key                     Value

# First name              Sinan    
# Last name               Konak   
# Job title               Student
# Company                 Techgrounds

"""
# Create a new script.
# Use user input to ask for their information (first name, last name, job title, company). Store the information in a dictionary.
# Write the information to a csv file (comma-separated values). The data should not be overwritten when you run the script multiple times.

"""


nieuw_woordenboek = dict(first_name = input("enter first name "), last_name = input("enter last name "), job_title = input("enter jobtitle "), company = input("enter company ") )
print(nieuw_woordenboek)

import csv

with open('mijn_woordenboek.csv', 'a', newline='' ) as f:
    fieldnames = ['first_name', 'last_name', 'job_title', 'company']
    writer = csv.DictWriter(f, fieldnames=nieuw_woordenboek.keys())
    writer.writeheader()
    writer.writerow(nieuw_woordenboek)
