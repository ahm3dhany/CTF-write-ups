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

