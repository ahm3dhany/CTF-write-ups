## Hidden in script

### The Problem:

> CyberBank (https://cyber-bank.testmycode.io/) should have a hidden debugging mode in their Javascript code 
> which should leak their secret backend key. 
> Can you find it?

### The Solution:

1. Go to "https://cyber-bank.testmycode.io/".
2. Right-Click -> "View Page Source" -> inspect the <script> element -> go to the *.js file and inspect it
3. Near the end of the file:

	```js
	var _0xfbfd=["cyberdebugmode","true","GET","/nothing_to_see_here.json","open","onload","readyState","status","responseText",
	"parse","innerHTML","start-container","getElementById","backend-key","onerror","send","ready"];
	```

4. Go to "https://cyber-bank.testmycode.io/nothing_to_see_here.json":

	```js	
	{
	  "backend-key": "BM1GOMYajD4ONBHxEOq4"
	}
	```

### The flag:
`BM1GOMYajD4ONBHxEOq4`

