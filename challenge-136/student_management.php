#!/usr/bin/php

<?php

	$student_count = (int) strtok(fgets(STDIN), " \n\t");
	$assignment_count = (int) strtok(" \n\t");
	//echo ("student_count: $student_count, assignment_count: $assignment_count");

	for ($i = 0; $i < $student_count; $i++) {
    	$student_name = strtok(fgets(STDIN), " \n\t");
    	$average = 0;
    	for ($j = 0; $j < $assignment_count; $j++) {
    		$current_grade = (float) strtok(" \n\t");
    		$average += $current_grade / $assignment_count;
    	}
    	echo "$student_name $average\n";
	}

?>