#!/usr/bin/php

<?php

	$student_count = (int) strtok(fgets(STDIN), " \n\t");
	$assignment_count = (int) strtok(" \n\t");

	$class_average = 0;
	$output = "";
	for ($i = 0; $i < $student_count; $i++) {
    	$student_name = strtok(fgets(STDIN), " \n\t");
    	$average = 0;
    	for ($j = 0; $j < $assignment_count; $j++) {
    		$current_grade = (float) strtok(" \n\t");
    		$average += $current_grade / $assignment_count;
    	}
    	$class_average += $average / $student_count;
    	$output .= "$student_name " . number_format($average, 2) . "\n";
	}
	echo number_format($class_average, 2) . "\n$output";

?>