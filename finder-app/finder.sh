#!/bin/sh

# @author: Abdelrahman Yasser
# @breif: a script that search for a given keyword in a given directory
#
# example: finder.sh <path to directory> <keyword(string)>

my_path=$1
my_keyword=$2

#all arguments are required, check the input parameters
if [ $# -eq 2 ]
then
    if [ -d ${my_path} ]
    then
        ##################################################
        #              actual script logic               #
        ##################################################

        #count the number of files in the given directory
        number_of_files_in_path=$(ls ${my_path} | wc -l)

        #find the number of lines
        number_of_matching_lines=$(grep -r ${my_path} -e ${my_keyword} | wc -l )

        #Statement message
        echo "The number of files are ${number_of_files_in_path} and the number of matching lines are ${number_of_matching_lines}"
        
        exit 0
    else
        echo "Path not found!"
        exit 1  
    fi
else
    echo "${0}: Parameters not matched!"
    echo "Number of Params: ${#}"
    exit 1
fi