#!/bin/bash
# ***** To read .txt files from a directory and append the contents to a new output file *****
# Exection: "sh script_name.sh source_folder output_file"

source_folder=$1
output_file=$2
dd if=/dev/null of=$output_file   # or echo > $output_file or cp /dev/null $output_file or truncate -s 0 $output_file

if [ $# -eq 2 ]
then
    for file_name in `ls -al $source_folder/*.txt | awk '{print $9}'`
    do
        cat $file_name >> $output_file
    done
else
    "Provided source folder and output file name as arguments"
fi
