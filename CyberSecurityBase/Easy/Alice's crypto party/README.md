## Alice's crypto party

### The Problem:

> Alice has chosen two primes p=45000023 and q=52000031 for her RSA modulus n and an encryption exponent e=3. 
> She receives a cryptotext 7 that has been encrypted with her public key. 
> What is the plaintext?

### The Solution:

You can use _extended euclidean algorithm_ to calculate _d_, or just use _wolframe-alpha_:


	```
	modular inverse of 3 mod 2340002494000660
	```

	the answer is "1560001662667107"


	```
	7^1560001662667107 mod 2340002591000713
	```

	the answer is "581051923957344"

### The flag:
`581051923957344`
