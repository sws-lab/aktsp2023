(** Näited. *)

(** Lihtsad funktsioonid. *)

(** Suurendab täisarvu ühe võrra. *)
let inc (x: int): int =
  x + 1

(** Suurendab täisarvu ühe võrra.
    Kasutada "lambdafunktsiooni". *)
let inc': int -> int =
  fun x -> x + 1


(** Rekursiivsed funktsioonid. *)

(** Arvutab faktoriaali.
    Kasutada if-i.
    Vihje: võrdusoperaator on = (mitte ==) ja selle vastand on <> (mitte !=). *)
let rec fact (n: int): int =
  if n = 0 then
    1
  else
    n * fact (n - 1)

(* a ? b : c *)
(* if a then b else c *)

(** Arvutab faktoriaali.
    Kasutada match-i. *)
let rec fact' (n: int): int =
  match n with
  | 0 -> 1
  | n -> n * fact' (n - 1)


(** Mitme argumendiga funktsioonid. *)

(** Arvutab suurima ühisteguri.
    Vt. https://en.wikipedia.org/wiki/Euclidean_algorithm#Implementations.
    Vihje: Jäägi operaator (mitte funktsioon) on mod. *)
let rec gcd (x: int) (y: int): int =
  if y = 0 then
    x
  else
    gcd y (x mod y)

(** Arvutab implikatsiooni.
    Kasutada mitme argumendiga match-i. *)
let implies (x: bool) (y: bool): bool =
  match x, y with
  | true, false -> false
  | false, false -> true
  | false, true -> true
  | true, true -> true



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
