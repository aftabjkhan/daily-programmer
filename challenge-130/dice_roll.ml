(* Aftab Khan, 2014 *)

open Random
open Str

let _ =
	let input_list = Str.split (regexp "d") (input_line stdin) in
		let roll_count = int_of_string (List.hd input_list) in
		let die_side_count = int_of_string (List.nth input_list 1) in
			Random.self_init ();
			for i=1 to roll_count do
				print_int ((Random.int die_side_count) + 1); print_char ' ';
			done;