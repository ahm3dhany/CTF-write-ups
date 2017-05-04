## Cannot get in

### The Problem:

> One of our cyber m0nkeys has forgotten his nix password. 
> He is a fantasy fan so the password is likely a character in either LotR or GoT. 
> That leaves us with roughly 2800 characters with first and last names to try at least and that is if he has not tried to be sneaky with the names. 
> Can you help our monkey? Here is the unshadowed information 
> "cybersecbase:$6$LwmDTb98$dAMmGCkiIakUVtT.bhYujjHGAwCd3un9KdYwfEDdJef/H9Q62mKFpOIA84.W0yDOiXKr4T7Gwpgw2JjD.4yGK.:1000:1000:csb,,,:/home/cybersecbase:/bin/bash"

### The Solution:

  ```shell
#!/bin/bash

#  We know the 1.algorithm 2.salt 3.pass+salt combination 4.hint about the password
#  We want the password
#  mkpasswd --method=sha-512 --salt=LwmDTb98 desiredPassword
#  $6$LwmDTb98$dAMmGCkiIakUVtT.bhYujjHGAwCd3un9KdYwfEDdJef/H9Q62mKFpOIA84.W0yDOiXKr4T7Gwpgw2JjD.4yGK.

salt=LwmDTb98
algorithm=sha-512
unshadowed='$6$LwmDTb98$dAMmGCkiIakUVtT.bhYujjHGAwCd3un9KdYwfEDdJef/H9Q62mKFpOIA84.W0yDOiXKr4T7Gwpgw2JjD.4yGK.'

while read -r "word"
do
        val=$( mkpasswd --method=$algorithm --salt=$salt "$word" )
        [[ "'$val'" = "'$unshadowed'" ]] && echo "$word:$val:match!" >> log && break
done < <(hashcat --stdout -r /usr/share/hashcat/rules/InsidePro-PasswordsPro.rule wordlist.txt)

  ```


  ```shell
	$ ./script.sh
	$ cat log 
	RyellaFr3y:$6$LwmDTb98$dAMmGCkiIakUVtT.bhYujjHGAwCd3un9KdYwfEDdJef/H9Q62mKFpOIA84.W0yDOiXKr4T7Gwpgw2JjD.4yGK.:match!
  ```


  You can also use _**hashcat**_ to solve it:

  ```shell
	$ echo -n '$6$LwmDTb98$dAMmGCkiIakUVtT.bhYujjHGAwCd3un9KdYwfEDdJef/H9Q62mKFpOIA84.W0yDOiXKr4T7Gwpgw2JjD.4yGK.' > hash_file.txt

	$ hashcat --session=CannotGetIn \
	-m 1800 -a 0 \
	-r /usr/share/hashcat/rules/InsidePro-PasswordsPro.rule \
	hash_file.txt wordlist.txt \
	-o cracked_hashes.txt	
  ```

### The flag:
`RyellaFr3y`
