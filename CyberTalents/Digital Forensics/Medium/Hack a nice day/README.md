## Hack a nice day    

### The Problem:

> can you get the flag out to hack a nice day. Note: Flag format flag{XXXXXXX} (https://s3-eu-west-1.amazonaws.com/hubchallenges/Forensics/info.jpg)

### The Solution:

- `strings info.jpg | less`: 
```
...
badisbad
...
```

- `steghide extract -sf info.jpg`  


### The flag: 
`flag{Stegn0_1s_n!ce}`


