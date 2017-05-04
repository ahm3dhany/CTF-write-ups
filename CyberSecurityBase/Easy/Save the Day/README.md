## Save the Day

### The Problem:

> A critical production system needs maintenance but everyone has forgotten how to access the system. 
> The management has hired you to hack the system and to provide them a way to get back in! 
> Unfortunately, due to budgetary constraints, you all you were given was this log file: 
> http://sec-mooc-1.cs.helsinki.fi/logs/60f3e5fe-bb7b-488c-ac81-15af3f8d41c6/log.gz 
> Can you save the day and recover the administrative access?

### The Solution:

  ```shell
	$ wget http://sec-mooc-1.cs.helsinki.fi/logs/60f3e5fe-bb7b-488c-ac81-15af3f8d41c6/log.gz
	$ gunzip log.gz
	$ awk 'END { print NR }' log
	1098868

	$ head log
	90.216.98.52 - - [12/May/2013:22:38:27 +0300] "GET /SQlite/main.php HTTP/1.0" 403 4961 "[FILTERED]" "Mozilla/5.0 (Windows CE; en-US; rv:1.9.2.20) Gecko/2016-04-07 17:59:40 Firefox/5.0"
	70.150.92.28 - - [12/May/2013:22:39:13 +0300] "PATCH /cho HTTP/1.0" 403 4994 "[FILTERED]" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5342 (KHTML, like Gecko) Chrome/15.0.844.0 Safari/5342"
	116.146.175.92 - - [12/May/2013:22:40:13 +0300] "POST /quilt HTTP/1.0" 500 4990 "[FILTERED]" "Mozilla/5.0 (X11; Linux x86_64; rv:1.9.7.20) Gecko/2010-09-09 14:20:31 Firefox/3.6.7"

	$ awk '{ print $6 }' log | sort -u
	"DELETE
	"GET
	"PATCH
	"POST
	"PUT

	$ grep -iE 'POST.*password' log
	13.207.157.242 - - [21/Nov/2016:13:52:55 +0300] "POST /sessions/new?username=admin&password=wronghorsebatterystable HTTP/1.0" 403 4992 "[FILTERED]" "Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_3; rv:1.9.2.20) Gecko/2016-04-06 01:17:12 Firefox/3.8"
  ```

### The flag:
`wronghorsebatterystable`


