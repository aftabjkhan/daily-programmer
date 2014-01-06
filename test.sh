#!/bin/bash

# Aftab Khan, 2014

# Print usage instructions to console
usage()
{
cat ./test_usage.txt
}

project_dir=""


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

# Parse testconfig file
source "$project_dir/testconfig"

# Test Executables
for program in $programs
do

	if [ ! -e "$project_dir/$program$program_extension" ]	#Check if file does not exist
	then
		echo -e "\nWarning! Executable $project_dir/$program does not exist. Skipping...\n"
	else
		tests=0
		passed_tests=0

		echo -e "\n\n============ Testing \"$program\"... ============"

		for file in $test_files
		do
			echo -e "\nRunning Test: $file..."
			declare result=$($exec_command $project_dir/$program < $project_dir/$test_dir/$file.$input_extension)
			declare expected=$(cat $project_dir/$test_dir/$file.$output_extension)
			if [ "$verbose" == 1 ]; then
		    	echo "--Input:"
		    	cat $project_dir/$test_dir/$file.$input_extension
		   
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
