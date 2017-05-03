## Awkward Ending Syndrome

### The Problem:

> A Canadian Born person named Chad has received the mysterious message 
> "3B953347892900C95858A5C16FD8DFB0920DF37294CBC3313AAB85608D32328D" 
> that has been encrypted with his key 
> "000102030405060708090A0B0C0D0E0F". 
> Unfortunately, Chad forgot which encryption scheme he is using. 
> Can you decrypt the message?

### The Solution:

1. From the title of the challenge **A**wkward **E**nding **S**yndrome => **AES** I think.
2. Now If we take the first chunk of the cipher-text and decrypt it using the key we'll get => 0x546869734973546865466C6167444541 => "ThisIsTheFlagDEA"
3. If we take the second chunk and decrypt it with the key we'll get a weird ASCII (i.e. in hex 0x7F953347892900C95858A5C16FD8DFB0).
4. Now let's think what happen if the cipher-text is larger than the key:
	- divide the cipher to chunks, each of the chunks are equal in size with the key:

	```
	1st chunk(cipher-text or input data):	3B953347892900C95858A5C16FD8DFB0
	IV:					00000000000000000000000000000000
	Key:					000102030405060708090A0B0C0D0E0F
	```

	- decrypt first chunk with the key:

	```
	Output[hex]:				546869734973546865466C6167444541
	Output[ASCII]:				ThisIsTheFlagDEA
	```

	- decrypt the second with the key & with the first chunk as IV:

	```
	2nd chunk(cipher-text or input data):   920DF37294CBC3313AAB85608D32328D
	IV(1st chunk):                          3B953347892900C95858A5C16FD8DFB0
	Key:                                    000102030405060708090A0B0C0D0E0F

	Output[hex]:				44000000000000000000000000000000
	Output[ASCII]:				D
	```


### The flag:
`ThisIsTheFlagDEAD`



