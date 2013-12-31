#!/bin/bash

# Run with flag "-v" for verbose test results

programs="./transpose"
exec_command=""
test_dir="./test/"
test_files="test1 test2"
input_extension=".input"
output_extension=".output"

readonly EXTENSION_LENGTH=0

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
			declare result=$($exec_command $program_name < $test_dir$file$input_extension)
			declare expected=$(cat $test_dir$file$output_extension)
			if [ "$1" == "-v" ]; then
		    	echo "--Input:"
		    	cat $test_dir$file$input_extension
		   
		    	echo -e -n "\n--Output:\n"
		    	echo "$result"

		    	echo -e -n "--Expected:\n"
		    	echo "$expected"
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