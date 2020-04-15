## Easy Message

### The Problem:

> I Have a Message for you. (http://35.240.62.111/easymessage/)

### The Solution:

- `dirb http://35.240.62.111/easymessage/`:

  > http://35.240.62.111/easymessage/robots.txt

- `robots.txt`:  
```
User-agent: *
Disallow: /?source
```

- `http://35.240.62.111/easymessage/?source`:
```
 <?php

$user = $_POST['user'];
$pass = $_POST['pass'];

include('db.php');

if ($user == base64_decode('Q3liZXItVGFsZW50') && $pass == base64_decode('Q3liZXItVGFsZW50')
    {
        success_login();
    }
    else {
        failed_login();
}

?> 
```

- base64_decode(`Q3liZXItVGFsZW50`) -> `Cyber-Talent` 
- log on:
```
I Have a Message For You
..-. .-.. .- --. -.--. .. -....- -.- -. ----- .-- -....- -.-- ----- ..- -....- .- .-. ...-- -....- -- ----- .-. ... ...-- -.--.- 
```

- morse_decode(`..-. .. etc.`)

### The flag: 
`FLAG(I-KN0W-Y0U-AR3-M0RS3)`

### Notes:
- OWASP TOP 10 `Missing Function Level Access Control`.
- CWE-284.



