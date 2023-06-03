#!/bin/sh

# @author: Abdelrahman Yasser
# @breif: a script that writes a given string in a given file
#
# example: writer.sh <path_to_file> <write_string>

my_filepath=$1
my_writestr=$2

#all arguments are required, check the input parameters
if [ $# -eq 2 ]
then
    ##################################################
    #              actual script logic               #
    ##################################################

    #creates a new file with given path (path includes file name!)
    # NOTE: dirname strips the parent link from a path
    #       basename strips the last link in a path
    mkdir -p "$(dirname ${my_filepath})" && touch ${my_filepath}
    if [ -f ${my_filepath} ]
    then
        #write the string to the file
        echo ${my_writestr} > ${my_filepath}
        exit 0
    else
        echo "Failed to find the created file!"
        exit 1
    fi
else
    echo "${0}: Parameters not matched!"
    echo "Number of Params: ${#}"
    exit 1
fi