(** Enum tüübid. *)

type color =
  | Red
  | Green
  | Blue

(** Näide:
    Teisendab värvi sõneks, vastavalt "R", "G" ja "B". *)
let show_color (c: color): string =
  match c with
  | Red -> "R"
  | Green -> "G"
  | Blue -> "B"

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
let example_int_tree =
  Branch (
    Leaf 1,
    Branch (
      Branch (
        Branch (
          Leaf 2,
          Leaf 3
        ),
        Leaf 4
      ),
      Leaf 5
    )
  )

(** Ülesanne:
           .
         /   \
       .       .
      / \     / \
    'a' 'b' 'b' 'a' *)
let example_char_tree =
  Branch (
    Branch (
      Leaf 'a',
      Leaf 'b'
    ),
    Branch (
      Leaf 'b',
      Leaf 'a'
    )
  )


(** Näited. *)

(** Arvutab puu kõrguse. Lehe kõrgus on 0.
    Vihje: Kasuta max funktsiooni. *)
let rec height (t: 'a tree): int =
  match t with
  | Leaf _ -> 0
  | Branch (l, r) -> 1 + max (height l) (height r)

(** Teisendab puu sõneks. Vt teste.
    Vihje: Sõnede konkateneerimise operaator on ^. *)
let rec show_tree (show_leaf: 'a -> string) (t: 'a tree): string =
  match t with
  | Leaf x -> show_leaf x
  | Branch (l, r) ->
    "(" ^ show_tree show_leaf l ^ " " ^ show_tree show_leaf r ^ ")"

(** Rakendab funktsooni puu lehtedele. *)
let rec tree_map (f: 'a -> 'b) (t: 'a tree): 'b tree =
  match t with
  | Leaf x -> Leaf (f x)
  | Branch (l, r) -> Branch (tree_map f l, tree_map f r)


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
