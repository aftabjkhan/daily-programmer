(* Aftab Khan *)

(* An implementation of the Braille to plaintext converter that encodes each
braille character (via raised and lowered "bits") to minimize dictionary size *)

open Str

let braille_char_length = 6;;
let binary_1_char = '.';;

let encoded_charset = " q g p fyn dxm c r hvl bzo euk a twj s i";;

let binary_bit_to_dec bbit_char dec_place =
 	if (bbit_char = binary_1_char)
 	then int_of_float ((float_of_int 2) ** (float_of_int (braille_char_length - dec_place - 1))) 
 	else 0

let match_letter braille =
	(* Use tailed recursion across braile string chars (map left) to convert to 
	decimal encoding and lookup from encoded_charset string *)
	let rec loop i sum =
		if i = braille_char_length then sum
		else loop (i + 1) (sum + (binary_bit_to_dec braille.[i] i))
		in
			encoded_charset.[(loop 0 0)]

let _ = 
    (* Read in and tokenize (create list of) each line of each braille character *)
	let l1_list = Str.split (regexp " ") (input_line stdin) in 
	let l2_list = Str.split (regexp " ") (input_line stdin) in
	let l3_list = Str.split (regexp " ") (input_line stdin) in
        (* Create list of braille characters, appending the ith of each line together *)
        let braille_list = List.map2 (^) (List.map2 (^) l1_list l2_list) l3_list in
            (* Match each character with its corresponding alphabet letter and print *)
            ignore(List.map print_char (List.map match_letter braille_list));
            print_newline ()

(*
Character Encoding: 

(msb)*****(lsb) where
'O' = 0b0; '.' = 0b1

| "OOOOO." -> "q" = 1
| "OOOO.." -> "g" = 3
| "OOO.O." -> "p" = 5
| "OOO..." -> "f" = 7
| "OO.OOO" -> "y" = 8
| "OO.OO." -> "n" = 9
| "OO.O.." -> "d" = 11
| "OO..OO" -> "x" = 12
| "OO..O." -> "m" = 13
| "OO...." -> "c" = 15
| "O.OOO." -> "r" = 17
| "O.OO.." -> "h" = 19
| "O.O.OO" -> "v" = 20
| "O.O.O." -> "l" = 21
| "O.O..." -> "b" = 23
| "O..OOO" -> "z" = 24
| "O..OO." -> "o" = 25
| "O..O.." -> "e" = 27
| "O...OO" -> "u" = 28
| "O...O." -> "k" = 29
| "O....." -> "a" = 31
| ".OOOO." -> "t" = 33
| ".OOO.O" -> "w" = 34
| ".OOO.." -> "j" = 35
| ".OO.O." -> "s" = 37
| ".OO..." -> "i" = 39
*)