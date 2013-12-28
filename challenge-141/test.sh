#!/bin/bash

# Run with flag "-v" for verbose test results

programs="Checksum.class"
exec_command="java"
test_files="./test/test1"
input_extension=".input"
output_extension=".output"
readonly PARENT_DIR_LENGTH=5
readonly EXTENSION_LENGTH=6

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
			declare program_name=${program:0:(${#program} - EXTENSION_LENGTH)}
			declare result=$($exec_command $program_name < $file$input_extension)
			declare expected=$(cat $file$output_extension)
			if [ "$1" == "-v" ]; then
		    	echo "--Input:"
		    	cat $file$input_extension
		   
		    	echo -e -n "\n--Output: "
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
