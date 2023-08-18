'''
The output should be:
0
1
2
3
4
8
9
'''
for i in range(10):
	if i < 5:
		print(i)
	elif i >= 8:
		print(i)
		
# Fixed by removing the else statement and break. Also changed "elif i < 8" to "elif i >= 8" 