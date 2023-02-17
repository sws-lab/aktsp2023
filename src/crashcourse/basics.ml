(** Näited. *)

(** Lihtsad funktsioonid. *)

(** Suurendab täisarvu ühe võrra. *)
let inc (x: int): int =
  failwith "TODO"

(** Suurendab täisarvu ühe võrra.
    Kasutada "lambdafunktsiooni". *)
let inc': int -> int = fun x ->
  failwith "TODO"


(** Rekursiivsed funktsioonid. *)

(** Arvutab faktoriaali.
    Kasutada if-i.
    Vihje: võrdusoperaator on = (mitte ==) ja selle vastand on <> (mitte !=). *)
let rec fact (n: int): int =
  failwith "TODO"

(** Arvutab faktoriaali.
    Kasutada match-i. *)
let rec fact' (n: int): int =
  failwith "TODO"


(** Mitme argumendiga funktsioonid. *)

(** Arvutab suurima ühisteguri.
    Vt. https://en.wikipedia.org/wiki/Euclidean_algorithm#Implementations.
    Vihje: Jäägi operaator (mitte funktsioon) on mod. *)
let rec gcd (x: int) (y: int): int =
  failwith "TODO"

(** Arvutab implikatsiooni.
    Kasutada mitme argumendiga match-i. *)
let implies (x: bool) (y: bool): bool =
  failwith "TODO"



(** Ülesanded. *)

(** Suurendab täisarvu kolme võrra.
    Kasutada funktsiooni inc kolm korda järjest. *)
let inc3 (x: int): int =
  failwith "TODO"

(** Arvutab kolmnurkarvu.
    Vt. https://en.wikipedia.org/wiki/Triangular_number. *)
let rec triangular (n: int): int =
  failwith "TODO"

(** Arvutab x astmes y.
    Võib eeldada, et y pole negatiivne. *)
let rec pow (x: int) (y: int): int =
  failwith "TODO"

(** Näide:
    Kas täht on täishäälik (inglise keeles)? *)
let is_vowel (c: char): bool =
  c = 'a' || c = 'e' || c = 'i' || c = 'o' || c = 'u'

(** Kas täht on täishäälik (inglise keeles)?
    Kasutada match-i. *)
let is_vowel' (c: char): bool =
  failwith "TODO"

(** Arvutab välistava või (xor).
    Kasutada mitme argumendiga match-i. *)
let xor (x: bool) (y: bool): bool =
  failwith "TODO"
