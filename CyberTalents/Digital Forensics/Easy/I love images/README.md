## I love images    

### The Problem:

> A hacker left us something that allows us to track him in this image, can you find it?   (https://s3-eu-west-1.amazonaws.com/hubchallenges/Forensics/godot.png)

### The Solution:

- `pngcheck godot.png`:   
```
godot.png  additional data after IEND chunk
ERROR: godot.png
```

- `IZGECR33JZXXIX2PNZWHSX2CMFZWKNRUPU======` => only uppercase letters and digits in range of 2-7 => indicator of base32 encoding.  
- `echo -n 'IZGECR33JZXXIX2PNZWHSX2CMFZWKNRUPU======' | base32 -d`

### The flag: 
`FLAG{Not_Only_Base64}`


