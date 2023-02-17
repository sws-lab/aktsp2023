(** Enum tüübid. *)

type color =
  | Red
  | Green
  | Blue

(** Näide:
    Teisendab värvi sõneks, vastavalt "R", "G" ja "B". *)
let show_color (c: color): string =
  failwith "TODO"

(** Ülesanne:
    Teisendab sõne värviks. show_color pöördfunktsioon.
    Vihje: Mittesobiva juhu jaoks kasuta wildcard mustrit _.
    Vihje: Vea jaoks kasuta failwith funktsiooni. *)
let parse_color (s: string): color =
  failwith "TODO"


(** Algebralised andmetüübid. *)

(** Polümorfne kahendpuu, mille elemendid on tüüpi 'a. *)
type 'a tree =
  | Leaf of 'a (** Leht sisaldab ühte väärtust. *)
  | Branch of 'a tree * 'a tree (** Vahetipul on kaks alampuud, väärtust pole. *)

(** Näide:
        .
       / \
      1   .
         / \
        .   5
       / \
      .   4
     / \
    2   3 *)
let example_int_tree = Leaf 1

(** Ülesanne:
           .
         /   \
       .       .
      / \     / \
    'a' 'b' 'b' 'a' *)
let example_char_tree = Leaf 'a'


(** Näited. *)

(** Arvutab puu kõrguse. Lehe kõrgus on 0.
    Vihje: Kasuta max funktsiooni. *)
let rec height (t: 'a tree): int =
  failwith "TODO"

(** Teisendab puu sõneks. Vt teste.
    Vihje: Sõnede konkateneerimise operaator on ^. *)
let rec show_tree (show_leaf: 'a -> string) (t: 'a tree): string =
  failwith "TODO"

(** Rakendab funktsooni puu lehtedele. *)
let rec tree_map (f: 'a -> 'b) (t: 'a tree): 'b tree =
  failwith "TODO"


(** Ülesanded. *)

(** Arvutab lehtede arvu. *)
let rec leaves (t: 'a tree): int =
  failwith "TODO"

(** Peegeldab puu, st. vahetab harud. *)
let rec tree_mirror (t: 'a tree): 'a tree =
  failwith "TODO"

(** Leiab puu vasakpoolseima lehe väärtuse. *)
let rec tree_left (t: 'a tree): 'a =
  failwith "TODO"
