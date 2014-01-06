#!/bin/bash

# Aftab Khan, 2014

# Print usage instructions to console
usage()
{
cat ./test_usage.txt
}

project_dir=""
programs=""
program_extension=""
exec_command=""
test_dir=""
test_files=""
input_extension=""
output_extension=""

verbose=0

# Parse args
while getopts “t:hv” opt; do
	case $opt in
		t)
			project_dir=$OPTARG
			;;
		h)
			usage
			exit
			;;
		v)
			verbose=1
			;;
		?)
			usage
			exit 1
			;;
	esac
done

# Check if project directory exists
if [ ! -e "$project_dir" ]; then
	echo "Error: Target directory <$project_dir> not specified or does not exist!"
	exit 1
fi

# Check if testconfig file exists within project directory
if [ ! -e "$project_dir/testconfig" ]; then
	echo "Error: testconfig file not found at <$project_dir/testconfig>"
fi


for program in $programs
do

	if [ ! -e "$program$program_extension" ]	#Check if file does not exist
	then
		echo -e "\nWarning! Executable $program does not exist. Skipping...\n"
	else
		tests=0
		passed_tests=0

		echo -e "\n\n============ Testing \"$program\"... ============"

		for file in $test_files
		do
			echo -e "\nRunning Test: $file..."
			declare result=$($exec_command $program < $test_dir$file$input_extension)
			declare expected=$(cat $test_dir$file$output_extension)
			if [ $verbose == 0 ]; then
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
