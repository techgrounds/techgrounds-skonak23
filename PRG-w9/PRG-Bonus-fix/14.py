'''
The output should be:
True
'''
def rtn(x):
	return(x)

foo = rtn(5)  # Changed from 3 to 5 so that the function returns a True 

if foo > rtn(4):
	print(True)
else:
	print(False)