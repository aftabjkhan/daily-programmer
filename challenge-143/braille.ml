(* Aftab Khan, 2013 *)

open Str
open List

let match_letter braille = 
    match braille with
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
    | _ -> " "
;;

let _ = 
    (* Read in and tokenize (create list of) each line of each braille character *)
	let l1_list = Str.split (regexp " ") (input_line stdin) in 
	let l2_list = Str.split (regexp " ") (input_line stdin) in
	let l3_list = Str.split (regexp " ") (input_line stdin) in
        (* Create list of braille characters, appending the ith of each line together *)
        let braille_list = List.map2 (^) (List.map2 (^) l1_list l2_list) l3_list in
            (* Match each character with its corresponding alphabet letter and print *)
            List.map print_string (List.map match_letter braille_list)
