## Fuzzy calculator

### The Problem:

> Our startup has developed an advanced calculator app for 64-bit Linuxes. 
> Unfortunately, the app has a serious memory safety problem. 
> What is more, our competitors have a similar products without these kind of problems. 
> We have act quickly before the market reacts and gets too much stacked against us. 
> Can you trace down the exact point where the problem occurs? 
> http://sec-mooc-1.cs.helsinki.fi/clock/a2f79db3-c910-482e-baa2-b4da7b3caa99/clock 
> (Note that the address should include all leading zeroes and the hexadecimal prefix e.g. 0x0000000000000001)

### The Solution:

1. Inspecting the file:

  ```shell
	$ file clock
	clock: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
	$ ./clock
	Welcome to the cyber calculator!
	Please type a calculation to proceed. (For example 1+1)
	4*5
	4.00 * 5.00 = 20.00
  ```

2. Fuzzing the calculator:
I wrote this script, which take advantage of *radamsa* as a fuzzer in order to crash the executable file:

  ```shell
	#!/bin/bash

	seedValue=0
	while true
	do
	  echo -n "WiLdStRiNg" | radamsa --seed "$seedValue" | ./clock
	  test $? -gt 127 && break
	  seedValue=$(( $seedValue + 1 ))
	done
	echo "Seed Value: $seedValue"
  ```

the script will exit after an indication of fatal program termination (i.e. exit code greater than 127 e.g. segmentation fault) and will print the seed value for radamsa.
(in my case printed 573):


  ```shell
	$ chmod +x fuzzer.sh clock
	$ ./fuzzer.sh

	Welcome to the cyber calculator!
	Please type a calculation to proceed. (For example 1+1)
	error
	Welcome to the cyber calculator!
	Please type a calculation to proceed. (For example 1+1)
	error
	Welcome to the cyber calculator!
	Please type a calculation to proceed. (For example 1+1)
	error
	Welcome to the cyber calculator!
	Please type a calculation to proceed. (For example 1+1)
	error
	.
	.
	.
	.
	.
	Welcome to the cyber calculator!
	Please type a calculation to proceed. (For example 1+1)
	./fuzzer.sh: line 9:  5662 Done                    echo -e -n "WiLdStRiNg"
	      5663                       | radamsa --seed "$seedValue"
	      5664 Segmentation fault      | /root/CTF/CyberSecurityBase/Medium/Fuzzy\ calculator/clock
	Seed Value: 573
  ```


3. Regenerating the same payload (With the seed from step 2) and redirecting the ouput (i.e. piping) to valgrind to detect where the segmentation fault exactly happened :

  ```shell
	$ echo -n "WiLdStRiNg" | radamsa --seed 573 | valgrind ./clock
	Welcome to the cyber calculator!
	Please type a calculation to proceed. (For example 1+1)
	==5302== Invalid write of size 8
	==5302==    at 0x403670: ??? (in /home/scarecrow/ctf/clock)			<==== here is your desired address
	==5302==    by 0x402962: fgets (in /home/scarecrow/ctf/clock)
	==5302==  Address 0xfff001000 is not stack'd, malloc'd or (recently) free'd
	==5302== 
	==5302== 
	==5302== Process terminating with default action of signal 11 (SIGSEGV)
	==5302==  Access not within mapped region at address 0xFFF001000
	==5302==    at 0x403670: ??? (in /home/scarecrow/ctf/clock)
	==5302==    by 0x402962: fgets (in /home/scarecrow/ctf/clock)
	==5302==  If you believe this happened as a result of a stack
	==5302==  overflow in your program's main thread (unlikely but
	==5302==  possible), you can try to increase the size of the
	==5302==  main thread stack using the --main-stacksize= flag.
	==5302==  The main thread stack size used in this run was 8388608.
	Segmentation fault (core dumped)
  ```

### The flag:
`0x0000000000403670`


