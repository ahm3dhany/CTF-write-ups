## Who am i?

### The Problem:

> Do not Start a fight you can not stop it (http://34.76.107.218/whoami/)

### The Solution:

- View page source:
```
<!-- 
	Guest Account:
	-=-=-=-=-=-=-=-
	Username:Guest
	Password:Guest  
-->
```  
- Log on with `Guest`
- Cookie has an Authentication value of `bG9naW49R3Vlc3Q%3D` (Notice the `%3D` at the end of the string -> URL encoding of '=' -> i.e. might be base64 encoding)
- base64 decoding(`bG9naW49R3Vlc3Q%3D`) -> `login=Guest7` 
- base64 encoding (`login=admin`) -> `bG9naW49YWRtaW4=`
- Modify `Authentication` value of the cookie to `bG9naW49YWRtaW4=` -> reload

### The flag: 
`FLag{B@D_4uTh1Nt1C4Ti0n}`

### Notes:
- **CWE-565** & **CWE-602**



