## Curious cat

### The Problem:

> Something is hidden behind the cat. 
> What could it be? Can you help? 
> http://sec-mooc-1.cs.helsinki.fi/curious_cat/5e988c05-5858-479d-ab80-38b745bec57c/cat02.jpg

### The Solution:

Open the image in hexeditor (i.e. `$ hexeditor cat02.jpg`) => search for the end of JPEG file (i.e. 0x DD F9) => you will found after it:

  `"{Search deeper. You might need a "passphrase"}"`

  ```shell
	$ apt-get install steghide
	$ steghide extract -sf cat02.jpg 
	Enter passphrase: 		<= here enter "passphrase"
	wrote extracted data to "cat02chidden.txt".
	$ cat cat02chidden.txt
	HiddenCatFlagDE23
  ```


### The flag:
`HiddenCatFlagDE23`


