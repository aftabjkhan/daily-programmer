#!/bin/bash

# Aftab Khan, 2014

# Print usage instructions to console
usage()
{
cat ./test_usage.txt
}

project_dir=""
verbose=0
make=0
make_if_unavail=0
clean=0

# Parse args
while getopts “t:hvmMc” opt; do
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
		m)
            make_if_unavail=1
            ;;
        M)
            make=1
            ;;
        c)
            clean=1
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

# Clean/Make if specified
if [ $make == 1 ]; then
	echo "Cleaning and Building Project..."
	make clean -C $project_dir
	make -C $project_dir
fi

# Test Executables
for program in $programs
do

	echo -e "\n\n============ Testing \"$program\"... ============"

	if [ ! -e "$project_dir/$program$program_extension" ] && [ $make_if_unavail == 0 ]; then
		echo -e "\nWarning! Executable $project_dir/$program does not exist. Skipping...\n"
	else
		if [ ! -e "$project_dir/$program$program_extension" ] && [ $make_if_unavail == 1 ]; then
			echo -e "\nExecutable $project_dir/$program does not exist. Making..."
			make -C $project_dir
		fi

		tests=0
		passed_tests=0

		for file in $test_files
		do
			echo -e "\nRunning Test: $file..."
			if [ -z "$exec_command" ]; then
				result=$($project_dir/$program $args< $project_dir/$test_dir/$file$input_extension)
			else
				result=$($exec_command $program $args< $project_dir/$test_dir/$file$input_extension)
			fi
			expected=$(cat $project_dir/$test_dir/$file$output_extension)
			if [ "$verbose" == 1 ]; then
		    	echo "--Input:"
		    	cat $project_dir/$test_dir/$file$input_extension
		   
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

# Clean after testing if specified
if [ $clean == 1 ]; then
	echo "Cleaning Up Builds..."
	make clean -C $project_dir
	echo ""
fi