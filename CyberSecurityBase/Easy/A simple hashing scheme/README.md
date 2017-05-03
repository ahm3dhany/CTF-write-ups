## A simple hashing scheme

### The Problem:

> Simple hashing involves encoding of strings of characters for example "hash" -> hex 68617368 -> dec 1751217000. 
> A hash function takes in strings of variable length and transforms them into fixed length strings. 
> A simple example would be to take modulus 16 of the string. 
> What would the mod be for string "flagc"

### The Solution:

1. Convert "flagc" from String to Hex	=>	0x666c616763
2. Convert 666c616763 from Hex to Decimal =>	439904986979
3. Calculate `439904986979 mod 16`	=>	3

### The flag:
`3`


