#!/bin/bash

seedValue=0
while true
do
  echo -n "WiLdStRiNg" | radamsa --seed "$seedValue" | ./clock
  test $? -gt 127 && break
  seedValue=$(( $seedValue + 1 ))
done
echo "Seed Value: $seedValue"
