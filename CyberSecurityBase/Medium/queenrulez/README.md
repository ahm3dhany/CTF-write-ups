## queenrulez

### The Problem:

  > Charles's password is queenrulez2000 and the hash value of that password is 'bf078b4812ac9e58b486b8f75ba968ba4f18b502'. 
  > After attending Alice's crypto party, Charles changes his password, but keeps the beginning of the password the same and only changes the four numbers in the end to other numbers. 
  > The hash value of the new password is '3ede8b7d2e4c4fc26529ba543a6c4414793dc502'.

### The Solution:

1. Check the type of the hash using **hash-identifier** or **hashid**:

  ```shell
	Analyzing 'bf078b4812ac9e58b486b8f75ba968ba4f18b502'
	[+] SHA-1 
  ```

2. I wrote this script to find the desired password:

  ```shell
	#!/bin/bash

	: '
	This script is to calc sha-1 hashes for "queenrulez0000~queenrulez9999"
	'
	desiredHash="3ede8b7d2e4c4fc26529ba543a6c4414793dc502"

	for i in {0000..9999}
	do
		val=$( echo -n "queenrulez${i}" | openssl sha1 | cut -f2 -d' ' )
		[[ "'$val'" = "'$desiredHash'" ]] && break
	done

	echo "Password: queenrulez${i}, hash: $val"

  ```


  ```shell
	$ ./script.sh 
	Password: queenrulez5215, hash: 3ede8b7d2e4c4fc26529ba543a6c4414793dc502
  ```

### The flag:
`queenrulez5215`


