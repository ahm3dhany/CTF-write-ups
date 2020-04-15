## Admin has the power

### The Problem:

> Administrators only has the power to see the flag , can you be one ? (http://35.193.45.56/adminpower/) 

### The Solution:

- View page source:  
`<!-- TODO: remove this line ,  for maintenance purpose use this info (user:support password:x34245323)-->`  
- Logon with support  
- Change cookie role value to `admin` => reload

### The flag: 
`hiadminyouhavethepower`

### Notes:
- Client side authentication without integrity checking!  
- `$_COOKIE` vs `$_SESSION`  

- **CWE-565**: Reliance on Cookies without Validation and Integrity Checking:  
> The application relies on the existence or values of cookies when performing security-critical operations, but it does not properly ensure that the setting is valid for the associated user.  

> Attackers can easily modify cookies, within the browser or by implementing the client-side code outside of the browser. Reliance on cookies without detailed validation and integrity checking can allow attackers to bypass authentication.. etc.  

- **CWE-602** (parent of CWE-565): Client-Side Enforcement of Server-Side Security:  
> The software is composed of a server that relies on the client to implement a mechanism that is intended to protect the server.  

> When the server relies on protection mechanisms placed on the client side, an attacker can modify the client-side behavior to bypass the protection mechanisms resulting in potentially unexpected interactions between the client and server.. etc.  





