#! /usr/bin/bash 

result_filename='T202.txt'
> $result_filename

input_filePath=$1
input_file=$input_filePath
while read line; do
    # reading each line
    lineWithOutSpaces=`echo "$line" | tr -d "[:space:]"`
    echo -e "$((${#lineWithOutSpaces}))\t${line}" >> $result_filename
done < $input_file