(* Aftab Khan, 2013 *)

let _ = 
	let line_1 = input_line stdin in 
	let line_2 = input_line stdin in
	let line_3 = input_line stdin in
	print_string ("Test: " ^ line_1 ^ line_2 ^ line_3)


let match_letter braille = 
	match braille with
	  _ -> " "
    | "O....." -> "a"
    | "O.O..." -> "b"
    | "OO...." -> "c"
    | "OO.O.." -> "d"
    | "O..O.." -> "e"
    | "OOO..." -> "f"
    | "OOOO.." -> "g"
    | "O.OO.." -> "h"
    | ".OO..." -> "i"
    | ".OOO.." -> "j"
    | "O...O." -> "k"
    | "O.O.O." -> "l"
    | "OO..O." -> "m"
    | "OO.OO." -> "n"
    | "O..OO." -> "o"
    | "OOO.O." -> "p"
    | "OOOOO." -> "q"
    | "O.OOO." -> "r"
    | ".OO.O." -> "s"
    | ".OOOO." -> "t"
    | "O...OO" -> "u"
    | "O.O.OO" -> "v"
    | ".OOO.O" -> "w"
    | "OO..OO" -> "x"
    | "OO.OOO" -> "y"
    | "O..OOO" -> "z"
