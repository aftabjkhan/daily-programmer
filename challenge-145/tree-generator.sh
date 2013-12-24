#!/bin/bash

echo -e "\nWelcome to the ASCII Art Christmas Tree Generator!\n"
echo "Please enter the following (space separated):"
echo "Max-Tree-Width(Odd) Tree-Body-Character Tree-Trunk-Character"
echo -n ">> "

read tree_width body_char trunk_char

# If trunkChar is not null, the treeWidth and bodyChar must also be not null
if [ -n "$trunk_char" ]
then
	if [ "$(($tree_width % 2))" -eq 1 ]
	then
		# Initial row count = 0
		row_count=0
		# Initial char count (in row 0) = 1
		char_count=1
		# Initial space count (in row 0) = tree_width / 2
		space_count=$(($tree_width / 2))
		# Total number of tree body rows = floor(tree-width / 2) + 1
		max_rows=$(($(($tree_width / 2)) + 1))
		#alternately: let "max_rows=$(($(($tree_width / 2)) + 1))"

		# Print tree body
		while [ $row_count -lt $max_rows ]
		do

			# Print space characters
			a=0
			while [ $a -lt $space_count ]
			do
				echo -n " "
				let "a += 1"
			done

			# Print tree body characters
			b=0
			while [ $b -lt $char_count ]
			do
				echo -n "$body_char"
				let "b += 1"
			done

			# Increment row spacing
			echo ""

			# Increment variables
			let "row_count += 1"
			let "char_count += 2"
			let "space_count -= 1"
		done

	else 
		echo "Could not create tree! Tree Width value must be an odd integer" 2>&1
		exit 1
	fi
else
	echo "Could not create tree! Please provide a value for all 3 parameters" 2>&1
	exit 1
fi
