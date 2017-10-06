#!/bin/bash

ASCII_Art_txt_file=$1
#Number_of_Lines=$(wc -l $ASCII_Art_txt_file)
Number_of_Lines=$(awk 'END{print NR}' $ASCII_Art_txt_file)
touch output_file.txt
for i in $(seq 1 $Number_of_Lines)
do
  grep "::${i}::" $ASCII_Art_txt_file | sed "s/::${i}:://" >> output_file.txt

done
