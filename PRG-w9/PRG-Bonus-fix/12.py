'''
The output should be:
4
16129
'''
def square(x):
	return x**2

foo = 127

nr = square(2)
print(nr)

big = square(foo)
print(big)

# foo = 127 was positioned below the print statements, moved it up so that the function was called correctly.