# SEC-07 - Passwords

In this Assigment we will take a deeper dive into the concept of 'passwords'and the strategies that can be used for creating and storing passwords. Furtheremore we will take a look at the concept of hashing and why it is preferred over symmetric encryption for storing passwords.

Passwords can be understood as secret codes that grant access to a particular system or account. They are designed to verify our identity and ensure that only authorized individuals can gain entry. While passwords might seem simple on the surface, there is an intricate back-end process that ensures their effectiveness

When we create a password, it's important to implement strategies that enhance its strength. A strong password should be unique, long, and contain a combination of letters (both uppercase and lowercase), numbers, and special characters. It is crucial to avoid using common phrases or easily guessable information like birthdates or names, as these can make passwords vulnerable to hacking attempts.

By employing effective strategies, such as creating strong and unique passwords, and using technologies like hashing, we can significantly reduce the risk of unauthorized access to information that is confidential.


## Key-terms

- [x] <strong>hashing</strong> -> A way to convert information, like a password, into a scrambled code that cannot be easily reversed. Principle how it works: you assign a numeric or alphanumeric string to (a piece of data) by applying a function whose output values are all the same number of bits in length
- [x] <strong>Rainbow Table</strong> -> precomputed table that contains a vast number of possible passwords and their corresponding hash values. It is used as a hacking tool to crack passwords based on their hash values.
- [x] <strong>MD5</strong> (Message Digest Algorithm 5) -> a cryptographic hash function that produces a fixed-size (128bit) hash value from an input such as a password or a piece of data. 
- [x] <strong>Salting</strong> -> the practice of adding a unique and random string of characters to a password before it is hashed. This additional string is called a salt. The purpose of salting is to make each password hash unique, even if the original passwords are the same.


## Requirements

- [x] A peer
- [x] Your linux machine
- [x] An online Rainbow Table like https://crackstation.net/



## Tasks

- [x] Find out what hashing is and why it is preferred over symmetric encryption for storing passwords.
- [x] Find out how a Rainbow Table can be used to crack hashed passwords.
- [x] Below are two MD5 password hashes. One is a weak password, the other is a string of 16 randomly generated characters. Try to look up both hashes in a Rainbow Table.
03F6D7D1D9AAE7160C05F71CE485AD31
03D086C9B98F90D628F2D1BD84CFA6CA
- [x] Create a new user in Linux with the password 12345. Look up the hash in a Rainbow Table.
- [x] Despite the bad password, and the fact that Linux uses common hashing algorithms, you won’t get a match in the Rainbow Table. This is because the password is salted. To understand how salting works, find a peer who has the same password in /etc/shadow, and compare hashes.

Hashing example:
```
[Text]					[Hash]
hello my name is sinan			-> 77add1d5f41223d5582fca736a5cb335
hello					-> 5d41402abc4b2a76b9719d911017c592
```
Hashes stay a fixed length, in the example above (MD5) 128 bit, so 32 characters long. no matter the length of the text input.


### Sources used

| Bron        | Beschrijving |
| ----------- | ----------- |
| https://en.wikipedia.org/wiki/MD5 | Article on MD5 |
| https://www.jscape.com/blog/understanding-hashing | Intro to hashes and hashing |
| https://en.wikipedia.org/wiki/Rainbow_table | Article about Rainbow Tables |
| https://www.authgear.com/post/password-hashing-salting | Hashing and Salting explained |
| https://canonical.com/blog/fips-certification-ubuntu-20-04-lts | FIPS-140-2 Ubuntu certification | 
| https://linuxize.com/post/etc-shadow-file/ | Article on linux pw's |



### Problems experienced

None.


### Result(s)

*Below you will find the images showing the results along with their descriptions*

Check out Key-terms for an elaboration on hashing.

So why would one prefer hashing over symmetric encryption for storing passwords? 
The technique that is used for hashing makes it a one-way process. So once a password is hashed, it is practically impossible to turn it back to the original password. This not the case for symmetric encryption because it is a two-way function. 

------------------------------------------

A rainbow table is used to crack password hashes stored in a database. This table contains precomputed hash values for a wide range of possible passwords. By comparing the hash values from the rainbow table with the stored hashes, attackers can quickly find the original passwords associated with the hashes.

Given are the following MD5 hashes:
```
1. weak pw:  				03F6D7D1D9AAE7160C05F71CE485AD31
2. 16 randomly generated characters:	03D086C9B98F90D628F2D1BD84CFA6CA
```
When I enter the first one in the given online Rainbow Table it is able to decrypt it :

![hash-result1](../00_includes/SEC-07/hash-green.png)

With the second one it fails to decrypt:

![hash-result2](../00_includes/SEC-07/hash-red.png)

----------------------------------------------------------

I created a new user with pw "12345" in my VM, and looked up in the directory where passwords are stored to find the newly created user and its hashed pw ```/etc/shadow``` :

![hash-user-linux](../00_includes/SEC-07/sinank-pwhash.png)

The password hash is located between the first and second colons (:) in the output. So in this case: ```$6$YUCZcsZfVOA3cyvt$K0OXmhet0EJEYK929ORQK85NNZ6fskbcT4vvZsVUsvni7oIifEfm4bURxCEJj8aO8cE./.Q5Z2z6hm5fKKP2r0```

When entering this hash in the Rainbow Table, it fails find a match. (luckily)

Comparison of my pw hash and my peer's:
```
<sinan>
$6$YUCZcsZfVOA3cyvt$K0OXmhet0EJEYK929ORQK85NNZ6fskbcT4vvZsVUsvni7oIifEfm4bURxCEJj8aO8cE./.Q5Z2z6hm5fKKP2r0

<zev>
$6$qRABEw9bgJGU/WFS$jdpCNBBCFoz7VD3CkKnYMQAcEX5YUrKLqOclP3txEzeyo2v2MEGA/xifxkGfXm4IS4ezRA8uj2ulRl6xyggTZ1
```
After thouroughly analyzing the strings. The only similarity we discovered are the first three characters ```$6$```

This is because "Salt" is added when creating the password. Nearly all distributions and variations of Unix, Linux, including our VM which runs on Ubuntu, use hashes with salts so that the risk of getting a password breach is minimized. Ubuntu uses the FIPS 140-2 level 1 security standard for its cryptographic modules and is certified 


