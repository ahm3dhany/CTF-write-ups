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
