# NTW-04 - Counting in Binary and Hex

In this Assigment we will take a deeper dive into the concept of counting and calculating numbers in Hex, Decimal and Binary format.

In binary, we only have two digits: 0 and 1. Instead of adding another digit when we reach 9, we add another digit when we reach 1. So, the counting sequence in binary goes like this: 0, 1, 10, 11, 100, and so on. Each digit in binary is called a bit, and a group of 8 bits is called a byte. Binary counting is the foundation of how computers store and process information. It's a language that computers understand and use to represent everything from numbers and text to images and sounds.

Another counting system used in computing is hexadecimal or hex for short. Hexadecimal is a base-16 system, meaning it uses 16 digits: 0 to 9 and A to F. It allows us to represent large binary numbers in a more compact and human-readable way.

Understanding binary and hex is essential in the technical world of IT, as it helps us understand how information is stored, manipulated, and communicated in the digital world.



## Key-terms
- [x] <strong>Decimal</strong> -> Decimal notation is the writing of numbers in the base-ten numeral system (0,1,2,3,4,5,6,7,8,9)
- [x] <strong>Binary</strong> -> Numbering system prominent in IT where you write numbers using only two digits: 0 and 1.
- [x] <strong>Hex</strong> (Hexadecimal) -> Numbering system made up of 16 symbols (Base 16). It uses the decimal numbers and in addition the letters "A, B, C, D, E and F" .


## Requirements

- [x] Understanding the fundamentals of counting in "Hex" and "Binary"
- [x] Pen and paper
- [x] Calculator


### Sources used

| Bron        | Beschrijving |
| ----------- | ----------- |
| https://www.educative.io/blog/computer-number-systems-binary-hexadecimal-conversions | Comprehensive IT guide about Binary and Hexdecimal |
| https://www.theserverside.com/tip/Binary-and-hexadecimal-numbers-explained-for-developers | Binary and Hexadecimal conversion guide |
| https://www.youtube.com/watch?v=FFDMzbrEXaE | Number Systems Introduction - Decimal, Binary, Octal & Hexadecimal |


### Problems experienced

None.

### Formulas used for translating between number-systems

*Decimal to Binary -> Successive Division : Divide the given Decimal number by 2 in succesion and write down the "Remainder".*
Example: Suppose we want to convert the decimal number **16** to binary:

Divide 16 by 2: 16 ÷ 2 = 8 with a remainder of 0. Write down the remainder (0).
Divide 8 by 2: 8 ÷ 2 = 4 with a remainder of 0. Write down the remainder (0).
Divide 4 by 2: 4 ÷ 2 = 2 with a remainder of 0. Write down the remainder (0).
Divide 2 by 2: 2 ÷ 2 = 1 with a remainder of 0. Write down the remainder (0).
Divide 1 by 2: 1 ÷ 2 = 0 with a remainder of 1. Write down the remainder (1).
Now, read the remainders in reverse order: 10000. This is the binary representation of the decimal number 16.

*Binary to Decimal:*
Example: Suppose we want to convert the binary number **11001010** into decimal number:

Use formula : *Decimal Number = (bn * 2^n) + (bn-1 * 2^(n-1)) + ... + (b1 * 2^1) + (b0 * 2^0)*
(bn= binary digit)  ('n') represents the position of the binary digit from right to left, starting from 0.)

(11001010) = (1x128)+(1x64)+(0x32)+(0x16)+(1x8)+(0x4)+(1x2)+(0x1) = 128+64+0+0+8+0+2+0 = *202*






### Result(s)
*Below the comlumns with the corresponding translations*

| Decimal       | Binary |
| ---------- | --------- |
| 16 | 10000 |
| 128 | 10000000 |
| 228 | 11100100 |
| 112 | 1110000 |
| 73 | 1001001 |

| Binary       | Decimal |
| ---------- | --------- |
| 1010 1010 | 170 |
| 1111 0000 | 240 |
| 1101 1011 | 219 |
| 1010 0000 | 160 |
| 0011 1010 | 58 |

| Decimal       | Hex |
| ---------- | --------- |
| 15 | F |
| 25 | 19 |
| 246 | F6 |
| 125 | 7D |
| 209 | D1 |

| Hex       | Decimal |
| ---------- | --------- |
| 88 | 136 |
| E0 | 224 |
| CB | 203 |
| 2F | 47 |
| D8 | 216 |

