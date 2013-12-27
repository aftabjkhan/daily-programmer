let encoded_charset = " q g p fyn dxm c r hvl bzo euk a twj s i";;


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