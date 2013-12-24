#!/bin/bash

echo -e "\nWelcome to the ASCII Art Christmas Tree Generator!\n"
echo "Please enter the following (space separated):"
echo "Max-Tree-Width(Odd) Tree-Body-Character Tree-Trunk-Character"
echo -n ">> "

read tree_width body_char trunk_char

# If trunkChar is not null, the treeWidth and bodyChar must also be not null
if [ -n "$trunk_char" ]
then
	# TODO
else
	echo "Could not create tree! Please provide a value for all 3 parameters"
fi

