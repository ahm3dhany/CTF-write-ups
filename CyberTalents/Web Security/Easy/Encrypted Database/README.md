## Encrypted Database

### The Problem:

> The company hired an inexperienced developer, but he told them he hid the database and have it encrypted so the website is totally secure, can you prove that he is wrong ?? (http://34.77.37.110//encrypted-database/)

### The Solution:

- View page source:
  > **secret-admin**/assets/app.js  
  
- http://34.77.37.110/encrypted-database/secret-admin -> view page source:
  > <input type=**"hidden"** name="db" value="hidden-database/db.json" />
  
- Modify/remove `hidden`:
  > hidden-database/db.json

- `http://34.77.37.110/encrypted-database/secret-admin/hidden-database/db.json` -> `ab003765f3424bf8e2c8d1d69762d72c` -> 32 chars -> possible md5

- Used an online pre-computed lookup table for md5


### The flag: 
`badboy`


