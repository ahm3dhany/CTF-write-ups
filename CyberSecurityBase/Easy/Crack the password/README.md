## Crack the password

### The Problem:

> Can you figure out the password? 
> The binary file should work in 64-bit Linuxes.
> http://sec-mooc-1.cs.helsinki.fi/password/f375b6e1-a9f7-415f-a31d-9344eedaea4d/password_checker

### The Solution:

```shell
$ file password_checker 
password_checker: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=a330735fc5c052448491b6621f9585d4a09f20ac, not stripped
$ apt-get install ltrace
$ ltrace ./password_checker
__libc_start_main(0x400686, 1, 0x7ffe4c43d848, 0x400750 <unfinished ...>
printf("Enter the password :")                                                           = 20
__isoc99_scanf(0x4007ed, 0x7ffe4c43c0f0, 0x7f21e09b5780, 20Enter the password :blabla  
)                             = 1
strcmp("blabla", "CorrectPasswrdAA")                                                     = 31
puts("\nYou entered incorrect password"
You entered incorrect password
)                                                 = 32
+++ exited (status 0) +++
$ ./password_checker 
Enter the password :CorrectPasswrdAA

You entered correct password
```

### The flag:
`CorrectPasswrdAA`


