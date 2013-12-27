(* Aftab Khan, 2013 *)

open Str
open List

let concat_lines x y a = 
    (x ^ y) :: a
;;

let _ = 
	let l1_list = Str.split (regexp " ") (input_line stdin) in 
	let l2_list = Str.split (regexp " ") (input_line stdin) in
	let l3_list = Str.split (regexp " ") (input_line stdin) in
        let braille_list = List.fold_right2 concat_lines (List.fold_right2 concat_lines l1_list l2_list []) l3_list []
        in
            List.map print_string braille_list

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
