## Help Ann    

### The Problem:

> Ann scanned a QR code of an item, she tried to open the image but it seems it was corrupted, can you identify what is Ann lost item? (https://s3-eu-west-1.amazonaws.com/hubchallenges/Forensics/help_ann_please)

### The Solution:

- `file help_ann_please`  
- `binwalk help_ann_please`  > zlib > might be an indicator for a PNG file  
- `hexeditor help_ann_please`:  
change faulty magic number from `00 50 4E 47` to `89 50 4E 47`  

### The flag: 
`Flag{Aw3s0m3-Y0u-G0t-th1s}`


