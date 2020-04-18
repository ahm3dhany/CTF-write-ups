## Cypher Anxiety    

### The Problem:

> An image was leaked from a babies store. the manager is so annoyed because he needs to identify the image to fire charges against the responsible employee. the key is the md5 of the image (https://s3-eu-west-1.amazonaws.com/talentchallenges/Forensics/find+the+image.zip)

### The Solution:

- Following the TCP stream between `.6` & `.100`:    
```
Hey bro
Sup supp, are we ready
yeah, u got the files?
yes but i think the channel is not secured
the UTM will block the file transfer as the DLP module is active
ok we can use cryptcat
ok what the password then
let it be P@ssawordaya
hhh, ok
listen on 7070 and ill send you the file , bye
bye
```  

- apply `tcp.port == 7070` filter -> follow the TCP stream -> save as RAW.  
- netcat server `cryptcat -k P@ssawordaya -l -p 1234 > rawfile < /dev/null`  
- netcat client `cat rawfile | nc 127.0.0.1 1234`  
- `foremost rawfile`  
- `md5sum 00000000.jpg`  

### The flag: 
`3beef06be834f3151309037dde4714ec`


