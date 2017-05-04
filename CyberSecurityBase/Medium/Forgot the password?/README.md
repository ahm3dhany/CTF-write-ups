## Forgot the password?

### The Problem:

> It just happens that I forgot my password. 
> Can you help me figure it out? 
> The binary file should work in 64-bit Linuxes. 
> http://sec-mooc-1.cs.helsinki.fi/password_2/d61c9826-9914-41cd-94a3-ad68b5872a57/password_checker_2

### The Solution:

  ```shell
	$ file password_checker_2 
	password_checker_2: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=286010654f59d05b4e5b16578a413b3e02a86123, not stripped

	$ chmod +x password_checker_2
	$ ltrace ./password_checker_2 
	__libc_start_main(0x400aeb, 1, 0x7fffd2bb1dd8, 0x400c50 <unfinished ...>
	printf("Enter the password :")                   = 20
	__isoc99_scanf(0x400ced, 0x7fffd2bb0680, 0x7f20f75a0760, 0xfbad2a84Enter the password :blabla
	) = 1
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'Q') = "QRSTUVWXYZabcdefghijklmnopqrstuv"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., '2') = "23456789+/"
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., '9') = "9+/"
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'y') = "yz0123456789+/"
	strncat(0x7fffd2bb0640, 0x7fffd2bb05c0, 4, 0x7fffd2bb05c0) = 0x7fffd2bb0640
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'c') = "cdefghijklmnopqrstuvwxyz01234567"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'm') = "mnopqrstuvwxyz0123456789+/"
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'V') = "VWXYZabcdefghijklmnopqrstuvwxyz0"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'j') = "jklmnopqrstuvwxyz0123456789+/"
	strncat(0x7fffd2bb0640, 0x7fffd2bb05c0, 4, 0x7fffd2bb05c0) = 0x7fffd2bb0640
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'd') = "defghijklmnopqrstuvwxyz012345678"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'F') = "FGHIJKLMNOPQRSTUVWXYZabcdefghijk"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'B') = "BCDEFGHIJKLMNOPQRSTUVWXYZabcdefg"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'h') = "hijklmnopqrstuvwxyz0123456789+/"
	strncat(0x7fffd2bb0640, 0x7fffd2bb05c0, 4, 0x7fffd2bb05c0) = 0x7fffd2bb0640
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'c') = "cdefghijklmnopqrstuvwxyz01234567"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., '3') = "3456789+/"
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'N') = "NOPQRSTUVWXYZabcdefghijklmnopqrs"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., '3') = "3456789+/"
	strncat(0x7fffd2bb0640, 0x7fffd2bb05c0, 4, 0x7fffd2bb05c0) = 0x7fffd2bb0640
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'c') = "cdefghijklmnopqrstuvwxyz01234567"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'm') = "mnopqrstuvwxyz0123456789+/"
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'R') = "RSTUVWXYZabcdefghijklmnopqrstuvw"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'B') = "BCDEFGHIJKLMNOPQRSTUVWXYZabcdefg"...
	strncat(0x7fffd2bb0640, 0x7fffd2bb05c0, 4, 0x7fffd2bb05c0) = 0x7fffd2bb0640
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'Q') = "QRSTUVWXYZabcdefghijklmnopqrstuv"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'U') = "UVWXYZabcdefghijklmnopqrstuvwxyz"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'F') = "FGHIJKLMNOPQRSTUVWXYZabcdefghijk"...
	strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdef"..., 'C') = "CDEFGHIJKLMNOPQRSTUVWXYZabcdefgh"...
	strncat(0x7fffd2bb0640, 0x7fffd2bb05c0, 4, 0x7fffd2bb05c0) = 0x7fffd2bb0640
	strcmp("blabla", "CorrectPasswrdAAAB")           = 31
	puts("\nYou entered incorrect password"
	You entered incorrect password
	)         = 32
	+++ exited (status 0) +++
  ```

Notice the comparison between the two strings occurs here: `strcmp("blabla", "CorrectPasswrdAAAB")` (i.e comparing our arbitrary string "blabla" with the right password "CorrectPasswrdAAAB").

  ```shell
	./password_checker_2 
	Enter the password :CorrectPasswrdAAAB

	You entered correct password
  ```


### The flag:
`CorrectPasswrdAAAB`


