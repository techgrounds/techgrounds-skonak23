# SEC-05 - Asymmetric Encryption

In this Assigment we will take a deeper dive into the concept of asymmetric encryption.

Asymmetric encryption, also known as public-key encryption, is a method of encryption that uses a pair of keys: a public key and a private key. It provides a secure way to communicate and exchange information over untrusted channels, ensuring confidentiality, integrity, and authentication.

In asymmetric encryption, the public key is freely shared and used for encrypting data, while the private key is kept secret and used for decrypting the encrypted data. 

It is often used in combination with symmetric encryption to establish secure communication channels. For example, symmetric encryption is used for bulk data encryption, while asymmetric encryption is used to securely exchange the symmetric keys.




## Key-terms


- [x] <strong>Asymmetric (key) Encryption</strong> ->  type of encryption that uses two separates yet mathematically related keys (public key - private key) to encrypt and decrypt data
- [x] <strong>Cryptography</strong> -> Refers to the science of encrypting and decrypting. It explains the method of protecting information and communication through the use of (secret) codes, so that only those for whom the information is intended can read and process it
- [x] <strong>Signature (key)</strong> ->  result of a third-party applying a cryptographic signature to a representation of a cryptographic key. This is usually done as a form of assurance or verification. When you sign data with a digital signature, someone else can verify the signature, and can prove that the data originated from you and was not altered after you signed it.

### Strengths / Weaknesses

Asymmetric encryption :  

        	+     provides a secure way for communication even if the public key is intercepted by others.

		-     is computationally more intensive and slower compared to symmetric encryption.





## Requirements

- [x] The Slack channel your share with your entire cohort
- [x] A peer (Member of my team)
- [x] A key pair generator like https://travistidwell.com/jsencrypt/demo/




## Tasks

- [x] Generate a key pair.

- [x] Send an asymmetrically encrypted message to one of your peers via the public Slack channel. They should be able to decrypt the message using a key. The recipient should be able to read the message, but it should remain a secret to everyone else. You are not allowed to use any private messages or other communication channels besides the public Slack channel. Analyse the difference between this method and symmetric encryption.




### Sources used

| Bron        | Beschrijving |
| ----------- | ----------- |
| https://www.youtube.com/watch?v=_zyKvPvh808 | Public and Private keys |
| https://learn.microsoft.com/en-us/dotnet/standard/security/cryptographic-signatures | Cryptographic Signatures |
| https://www.youtube.com/watch?v=o_g-M7UBqI8 | Differences between asymmetric / symmetric illustrated |
| https://8gwifi.org/rsafunctions.jsp | Online Tool for RSA decryption |




### Problems experienced

None.


### Result(s)

*Below you will find the images showing the results along with their descriptions*

To proceed with this assignment. Me and my peer first generate a key pair using the 'Online RSA Key generator' provided for this assignment. Then each of us save the generated key pair (private + public key). I write down the plain text ```Watisdezezinnoutoch``` and encrypt it with my peer's public key. So now I send the encrypted text output to My peer. He is the only one who can decrypt the message using his private key.

So these are the steps in short:

- Generate key pair (public + private)
- Receive public key of your peer
- Encrypt your message with the receiver's public key
- Send encrypted message to peer
- Peer decrypts the message using his private key


```
Private Key:

-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCA+rLZSxZdPegPqdPdOW/mVTh21L+pYDsGl843OQ9okBXBHsQn
K1Ewx7ZqpUxPb1OQrnNVgCTNAbu72NOAQuRiFbyJakj5Mc+Dgw3cdGSETq7R5gWh
pZDDA/XfdGuh7yhhYZ3pCgNABJ3q48qRaadNnAxpMZVX/Uce3JI8DZl1lwIDAQAB
AoGABE7bXHCqnZCsyKEmh3QcrbfY+/cdM74YGp9FbwjD3/04DMxHRvumaZeyGxvM
UbbpNqLtDUULdaGCMMMMRXN2h1f9pb+gcMs63tBQ6msT7wMfoCinG/G76fNUvBEj
wrTq6ugEY/gvXjwBG9PepBKdvNy5AamNmeVlJKxNaOq6IWECQQDF6TgJmhTLlq9l
JGQhGBUiF624aPjnmy/GLOLcGRmXeoeTKOAYzoOkCzZtRnlnoKkyqoJmetFXcYzk
KGs4/S7RAkEAptYJxfA3lo+ZYw9kceXcKdN0I2f2agHGUbQBo3Phfqq2usZuvKgd
Zp0//CIZB8dRNR8yKN2LF57UlC3LqzSH5wJBAKl6sEw4sHovjf+1DDHy55YMZO24
pv3fPSgeJB+LNwkrGpKAvHdB0iVWnMMzSJ/fS0ViEs0je8XALYDsw/VHiyECQEOo
DwSPOuu6xjhO2Kv7zEHF95YYJeytVZBykCuJ5cspTbsGl4e4IVworvb/mOj3om4J
fZzm4u4sQgbpX2vJfMcCQHHMytHp4tXKHfKwQDH42Qe3KY8FUQYxZXheQXcDSIHL
FFoC77o44TkOif9mTgTDoUTCO2k1Z/gDuCowV5HMR1c=
-----END RSA PRIVATE KEY-----



Public Key:

-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCA+rLZSxZdPegPqdPdOW/mVTh2
1L+pYDsGl843OQ9okBXBHsQnK1Ewx7ZqpUxPb1OQrnNVgCTNAbu72NOAQuRiFbyJ
akj5Mc+Dgw3cdGSETq7R5gWhpZDDA/XfdGuh7yhhYZ3pCgNABJ3q48qRaadNnAxp
MZVX/Uce3JI8DZl1lwIDAQAB
-----END PUBLIC KEY-----



Plain text: Watisdezezinnoutoch

Encrypted: UjS9eLCJMc3YlKNy3GiMKHKlkYkhmAZZ+Mgo5zAtxAgAHBpNKPYWrrey38YQIKu3h/Ug0BEVw685HtGHE6uxOsD94soc8G5Qp4y5QUpNxvfhv2kgnNiHhLxI+rqpNHx+iWaAl7pGM+Od63uGYyKC5QxJjVI5yzMTU+Ulm3Kol7M=

```


![RSA-message-decryption](../00_includes/SEC-05/RSA-message-decrypt.png)

