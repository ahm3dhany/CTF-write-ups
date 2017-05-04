## Cracking the lost password

### The Problem:

> Can you figure out the password? 
> The binary file should work in 64-bit Linuxes. 
> http://sec-mooc-1.cs.helsinki.fi/password_3/ac964116-534f-488c-8cbe-3c4326d5b6d1/password_3

### The Solution:

1. Basic inpection: 

  ```shell
	$ wget http://sec-mooc-1.cs.helsinki.fi/password_3/ac964116-534f-488c-8cbe-3c4326d5b6d1/password_3
	$ file password_3 
	password_3: ELF 64-bit LSB executable, x86-64, version 1 (GNU/Linux), statically linked, stripped
	$ chmod +x password_3 
	$ ./password_3 
	Enter the password :qwerty

	You entered incorrect password

	$ ltrace ./password_3 
	Couldn't find .dynsym or .dynstr in "/proc/19138/exe"
  ```

2. Found **U**ltimate **P**acker for **Ex**ecutables header:

  ```shell
	$ strings password_3 | less
	...
	UPX!
	...

	$ upx password_3 
	upx: password_3: AlreadyPackedException
	Packed 0 files.
  ```

3. Unpack the executable file:

  ```shell
	$ upx -d password_3 
			       Ultimate Packer for eXecutables
				  Copyright (C) 1996 - 2013
	UPX 3.91        Markus Oberhumer, Laszlo Molnar & John Reiser   Sep 30th 2013

		File size         Ratio      Format      Name
	   --------------------   ------   -----------   -----------
	     20780 <-      6401   30.80%  linux/ElfAMD   password_3

	Unpacked 1 file.
  ```	
			
4. We can now debug it with *ltrace*:

  ```shell
	$ ltrace ./password_3 
	__libc_start_main(0x400686, 1, 0x7fff643e1278, 0x400750 <unfinished ...>
	printf("Enter the password :")                                                           = 20
	__isoc99_scanf(0x4007ed, 0x7fff643dfb20, 0x7f60770a1780, 20Enter the password :qwerty
	)                             = 1
	strcmp("qwerty", "CorrectPasswrdAAA")                                                    = 46
	puts("\nYou entered incorrect password"
	You entered incorrect password
	)                                                 = 32
	+++ exited (status 0) +++
	$ ./password_3 
	Enter the password :CorrectPasswrdAAA

	You entered correct password
  ```
			


Another method: (by @ mikaj)

1. Run the process:	

  ```shell
	$ ./password_3 
	Enter the password :
  ```

2. Open another shell and check the PID of the process:

  ```shell
	$ ps -aux | grep password_3
	root      6927  0.0  0.0   8276   644 pts/1    S+   14:31   0:00 ./password_3
	$ ps --pid 6927
	PID TTY          TIME CMD
	6927 pts/1    00:00:00 password_3
  ```

3. Generate a core file for this process:

  ```shell
	$ gcore -o dump 6927
	0x00007fd64ce345a0 in ?? ()
	Saved corefile dump.6927
  ```

4. Inspecting the core file:	

  ```shell
	$ strings dump.6927 | less
	...
	Enter the password :
	CorrectPasswrdAAA
	You entered correct password
	You entered incorrect password
	...
  ```

### The flag:
`CorrectPasswrdAAA`




