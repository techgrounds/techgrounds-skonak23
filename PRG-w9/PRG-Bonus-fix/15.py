'''
The output should be:
a5|||5|||5|||a5|||5|||5|||a5|||5|||5|||
'''
foo = ''
for i in range(3):
	foo += 'a5|||'
	for j in range(2):
		foo += '5|||'


print(foo)