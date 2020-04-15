## This is Sparta  

### The Problem:

> Morning has broken today they're fighting in the shade when arrows blocked the sun they fell tonight they dine in hell  (http://35.193.45.56/sparta/)

### The Solution:

- View page source:
```
<script>
var _0xae5b=["\x76\x61\x6C\x75\x65","\x75\x73\x65\x72","\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64","\x70\x61\x73\x73","\x43\x79\x62\x65\x72\x2d\x54\x61\x6c\x65\x6e\x74","\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x43\x6F\x6E\x67\x72\x61\x74\x7A\x20\x0A\x0A","\x77\x72\x6F\x6E\x67\x20\x50\x61\x73\x73\x77\x6F\x72\x64"];function check(){var _0xeb80x2=document[_0xae5b[2]](_0xae5b[1])[_0xae5b[0]];var _0xeb80x3=document[_0xae5b[2]](_0xae5b[3])[_0xae5b[0]];if(_0xeb80x2==_0xae5b[4]&&_0xeb80x3==_0xae5b[4]){alert(_0xae5b[5]);} else {alert(_0xae5b[6]);}}
</script>
```

- Seems like obfuscation -> organize:
```
<script>
var _0xae5b= [	"\x76\x61\x6C\x75\x65", 
				"\x75\x73\x65\x72",
				"\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64", 
				"\x70\x61\x73\x73", 
				"\x43\x79\x62\x65\x72\x2d\x54\x61\x6c\x65\x6e\x74", "\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x43\x6F\x6E\x67\x72\x61\x74\x7A\x20\x0A\x0A", 
				"\x77\x72\x6F\x6E\x67\x20\x50\x61\x73\x73\x77\x6F\x72\x64"];

function check(){
	var _0xeb80x2=document[_0xae5b[2]](_0xae5b[1])[_0xae5b[0]];
	var _0xeb80x3=document[_0xae5b[2]](_0xae5b[3])[_0xae5b[0]];
	
	if(_0xeb80x2==_0xae5b[4]&&_0xeb80x3==_0xae5b[4]){
		alert(_0xae5b[5]);
	} else {
		alert(_0xae5b[6]);
	}
}
</script>
```

- Converting HEXA to ASCII:
```
<script>
var _0xae5b= [	"value", 
				"user",
				"getElementById", 
				"pass", 
				"Cyber-Talent", 
				"                      Congratz", 
				"wrong Password"];

function check(){
	var _0xeb80x2=document.getElementById(user).value;
	var _0xeb80x3=document.getElementById(pass).value;
	
	if(_0xeb80x2=="Cyber-Talent" && _0xeb80x3=="Cyber-Talent"){
		alert("                      Congratz");
	} else {
		alert("wrong Password");
	}
}
</script>
```

### The flag: 
`{J4V4_Scr1Pt_1S_Aw3s0me}`

### Notes:
- **CWE-602**



