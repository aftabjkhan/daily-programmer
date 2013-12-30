#!/bin/bash

# Run with flag "-v" for verbose test results

programs="./overlapping-circles.py
./overlapping-circles-condensed.py"
test_files=test/*
readonly PARENT_DIR_LENGTH=5

for program in $programs
do

	if [ ! -e "$program" ]	#Check if file does not exist
	then
		echo -e "\nWarning! Executable $program does not exist. Skipping...\n"
	else
		tests=0
		passed_tests=0

		echo -e "\n\n============ Testing \"$program\"... ============"

		for file in $test_files
		do
			echo -e "\nRunning Test: $file..."
			declare result=$(./$program < $file)
			declare expected=${file:PARENT_DIR_LENGTH}
			if [ "$1" == "-v" ]; then
		    	echo "Input:"
		    	cat $file
		   
		    	echo -e -n "\nOutput: "
		    	echo "$result"
		    fi
		    if [ "$expected" == "$result" ]; then
		    	echo "Result: Success!"
		    	let "passed_tests += 1"
		    else
		    	echo "Result: Failure"
		    fi
		    let "tests += 1"
		done

		echo -e "\n\n------ Summary: -------"
		echo "| Tests $passed_tests of $tests passed |"
		echo -e "-----------------------\n"
	fi
done
