## Too curious cats

### The Problem:

> Cats are curious by nature and this cat was more or less curious on his travels. 
> He came back home but he brought something with him. Not ticks but something is hidden in this image. 
> Can you find it? http://sec-mooc-1.cs.helsinki.fi/cat_3/fd8101ef-bfce-4a68-8895-7d8406dc0941/cat03.bmp

### The Solution:

  ```shell
	$ sudo apt-get install ruby
	$ gem install rake zsteg
	$ zsteg -a cat03.bmp | more
	...
	b1,bgr,lsb,xy       .. text: "$lsbsecretrandom4027387520957partflag"
	...
  ```

### The flag:
`lsbsecretrandom4027387520957partflag`

