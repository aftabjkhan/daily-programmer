#! /usr/bin/env php

<?php

    $cent_values = array(
        "Quarters" => 25,
        "Dimes" => 10,
        "Nickels" => 5,
        "Pennies" => 1,
        );

    $input = trim(fgets(STDIN));
    $rem = (int) (((float) $input) * 100);

    foreach ($cent_values as $key => $value) {
        $coin_count = (int) ($rem / $value);
        if ($coin_count > 0)
            echo "$key: $coin_count\n";
        $rem -= $value * $coin_count;
    }

?>