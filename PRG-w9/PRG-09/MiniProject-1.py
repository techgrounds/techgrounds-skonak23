### In this project a game called TicTacToe has been created


# Tic-Tac-Toe
'''
# Generate a 3x3 board on the command line.
# This is a 2-player game, where one player inputs “X” and the other player inputs “O”.
# Bonus: create a single-player version that you can play against the computer.

'''

import random

# The game start by presenting you the intro below.
print("Welkom in je Boter met Kaas en Eieren")
print("--------------------------------------")

# Possible numbers that you and the cpu can choose from
# The Board that will show up in terminal is defined in the variable "SpelBord"
Mogelijke_Nummers = [1,2,3,4,5,6,7,8,9]
SpelBord = [[1,2,3], [4,5,6,], [7,8,9]]

rijen = 3
Kolommen = 3

def printSpelBord():
    for x in range(rijen):
        print("\n+---+---+---+")
        print("|", end="")
        for y in range(Kolommen):
            print("", SpelBord[x][y], end=" |")
    print("\n+---+---+---+")

def modifyArray(num, turn):
    num -= 1
    if(num == 1):
        SpelBord[0][0] = turn
    elif(num == 1):
        SpelBord[0][1] = turn
    elif(num == 2):
        SpelBord[0][2] = turn
    elif(num == 3):
        SpelBord[1][0] = turn
    elif(num == 4):
        SpelBord[1][1] = turn
    elif(num == 5):
        SpelBord[1][2] = turn
    elif(num == 6):
        SpelBord[2][0] = turn
    elif(num == 7):
        SpelBord[2][1] = turn
    elif(num == 8):
        SpelBord[2][2] = turn

def checkForWinner(SpelBord):
    ### X Axis -> Winning Conditions
    if(SpelBord[0][0] == 'X' and SpelBord [0][1] == 'X' and SpelBord[0][2] == 'X'):
        print("X heeft gewonnen!")
        return "X"
    elif(SpelBord[0][0] == 'O' and SpelBord[0][1] == 'O' and SpelBord[0][2] == 'O'):
        print("O heeft gewonnen!")
        return "O"
    elif(SpelBord[1][0] == 'O' and SpelBord[1][1] == 'O' and SpelBord[1][2] == 'X'):
        print("X heeft gewonnen!")
        return "X"
    elif(SpelBord[1][0] == 'O' and SpelBord[1][1] == 'O' and SpelBord[1][2] == 'O'):
        print("O heeft gewonnen!")
        return "O"
    elif(SpelBord[2][0] == 'X' and SpelBord[2][1] == 'X' and SpelBord[2][2] == 'X'):
        print("X heeft gewonnen!")
        return "X"
    elif(SpelBord[2][0] == 'O' and SpelBord[2][1] == 'O' and SpelBord[2][2] == 'O'):
        print("O heeft gewonnen!")
        return "O"
    ### Y Axis -> Winning Conditions
    if(SpelBord[0][0] == 'X' and SpelBord[1][0] == 'X' and SpelBord[2][0] == 'X' ):
        print("X heeft gewonnen!")
        return "X"
    elif(SpelBord[0][0] == 'O' and SpelBord[1][0] == 'O' and SpelBord[2][0] == 'O'):
        print("O heeft gewonnen!")
        return "O"
    elif(SpelBord[0][1] == 'X' and SpelBord[1][1] == 'X' and SpelBord[2][1] == 'X'):
        print("X heeft gewonnen!")
        return "X"
    elif(SpelBord[0][1] == 'O' and SpelBord[1][1] == 'O' and SpelBord[2][1] == 'O'):
        print("O heeft gewonnen!")
        return "O"
    elif(SpelBord[0][2] == 'X' and SpelBord[1][2] == 'X' and SpelBord[2][2] == 'X'):
        print("X heeft gewonnen!")
        return "X"
    elif(SpelBord[0][2] == 'O' and SpelBord[1][2] == 'O' and SpelBord[2][2] == 'O'):
        print("O heeft gewonnen!")
        return "O"
    ### Cross wins -> Winning Conditions
    elif(SpelBord[0][0] == 'X' and SpelBord[1][1] == 'X' and SpelBord[2][2] == 'X'):
        print("X heeft gewonnen!")
        return "X"
    elif(SpelBord[0][0] == 'O' and SpelBord[1][1] == 'O' and SpelBord[2][2] == 'O'):
        print("O heeft gewonnen!")  
        return "O"
    elif(SpelBord[0][2] == 'X' and SpelBord[1][1] == 'X' and SpelBord[2][0] == 'X'):
        print("X heeft gewonnen!")  
        return "X"
    elif(SpelBord[0][2] == 'O' and SpelBord[1][1] == 'O' and SpelBord[2][0] == 'O'):
        print("O heeft gewonnen!") 
        return "O" 
    else:
        return "N"

leaveloop = False
turncounter = 0


while(leaveloop == False):
    ### Jou beurt
    if(turncounter % 2 == 1):
        printSpelBord()
        numberPicked = int(input("\nChoose a number [1-9]: "))
        if(numberPicked >= 1 or numberPicked <= 9):
            modifyArray(numberPicked, 'X')
            Mogelijke_Nummers.remove(numberPicked)
        else:
            print("Verkeerde invoer. Probeer opnieuw.")
        turncounter +- 1
    ### Computer aan zet
    else:
        while(True):
            cpuChoice = random.choice(Mogelijke_Nummers)
            print("\nCpu choice: ", cpuChoice)
            if(cpuChoice in Mogelijke_Nummers):
                modifyArray(cpuChoice, '0')
                Mogelijke_Nummers.remove(cpuChoice)
                turncounter += 1
                break
# A winner has to be declared, if there is no winner, the print() function will declare no winner.
    winner = checkForWinner(SpelBord)
    if(winner != "N"):
        print("\nGame Over! Bedankt voor het spelen! ")
        break

    




