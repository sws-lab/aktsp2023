open Types

(** Listid. *)

(** Näited. *)

(** Teisendab puu elementide listiks (keskjärjestuses).
    Vihje: Listide konkateneerimise operaator on @. *)
let rec list_of_tree (t: 'a tree): 'a list =
  match t with
  | Leaf x -> [x]
  | Branch (l, r) -> list_of_tree l @ list_of_tree r

(** Suurendab täisarvude listi elemente ühe võrra. *)
let list_inc (xs: int list): int list =
  List.map (fun x -> x + 1) xs

(** Jätab täisarvude listist alles elemendid, mis on vähemalt 4. *)
let list_big (xs: int list): int list =
  List.filter (fun x -> x >= 4) xs

(** Liidab kokku täisarvude listi elemendid. *)
let list_sum (xs: int list): int =
  List.fold_left (fun acc x ->
      acc + x
    ) 0 xs

(** Liidab kokku täisarvude listi elemendid.
    Imperatiivsem lahendus. *)
let list_sum' (xs: int list): int =
  let acc = ref 0 in
  List.iter (fun x ->
      acc := !acc + x
    ) xs;
  !acc

(** Liidab kokku täisarvude listi elemendid.
    Rekursiivne funktsionaalne lahendus. *)
let rec list_sum'' (xs: int list): int =
  match xs with
  | [] -> 0
  | x :: xs' -> x + list_sum'' xs'


(** Ülesanded. *)

(** Korrutab täisarvude listi elemendid kahega. *)
let list_double (xs: int list): int list =
  failwith "TODO"

(** Jätab täisarvude listist alles elemendid, mis on paaris. *)
let list_even (xs: int list): int list =
  failwith "TODO"

(** Korrutab kokku täisarvude listi elemendid. *)
let list_product (xs: int list): int =
  failwith "TODO"



(** Hulgad. *)

(** Näited. *)

(** Täisarvude hulkade moodul. *)
module IntSet = Set.Make (Int)

(** Teisendab täisarvude puu hulgaks.
    Vihje: IntSet.singleton.
    Vihje: IntSet.union. *)
let rec intset_of_tree (t: int tree): IntSet.t =
  match t with
  | Leaf x -> IntSet.singleton x
  | Branch (l, r) -> IntSet.union (intset_of_tree l) (intset_of_tree r)


(** Puu elementide mooduli tüüp/signatuur. *)
module type TreeElement =
sig
  (** Abstraktne elemendi tüüp. *)
  type t

  (** Standardne võrdlusfunktsioon. *)
  val compare: t -> t -> int

  (** Teisendab elemendi sõneks. *)
  val show: t -> string
end

(** Puude moodul, mille argumendiks on elementide moodul.
    Parametriseeritud mooduleid nimetatakse funktoriteks. *)
module Tree (Element: TreeElement) =
struct
  type element = Element.t

  (** Elementide hulkade moodul. *)
  module Set = Set.Make (Element)

  (** Teisendab puu hulgaks. *)
  let rec to_set (t: element tree): Set.t =
    match t with
    | Leaf x -> Set.singleton x
    | Branch (l, r) -> Set.union (to_set l) (to_set r)

  (** Teisendab puu sõneks.
      Vihje: Element.show. *)
  let rec show (t: 'a tree): string =
    match t with
    | Leaf x -> Element.show x
    | Branch (l, r) ->
      "(" ^ show l ^ " " ^ show r ^ ")"
end
