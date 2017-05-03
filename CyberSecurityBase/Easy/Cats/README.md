## Cats

### The Problem:

> Something is not quite as it should be in this image. 
> Can you find it? 
> http://sec-mooc-1.cs.helsinki.fi/cats/537c93da-0be9-45da-85f4-857ac2b33f8d/cat.jpg

### The Solution:

0xFF, 0xD8 	=>	Start Of Image
0xFF, 0xD9 	=>	End Of Image





1.	Open the image in hexeditor (i.e. `$ hexeditor cat.jpg`) => ^W (i.e. press ctrl+W) to enter the Search => search for Hex bytes => type `FF D9`.
2.	^W Search => choose "Find Next" until you reach the end (i.e. there's no guarantee that you won't find another FFD9 within a jpeg image).
3.	At the end of the image you'll find: {HiddenCatFlag01}.

### The flag:
`HiddenCatFlag01`



