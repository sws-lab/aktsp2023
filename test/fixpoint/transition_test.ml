(** Transitiivse sulundi näide Vesali "The Sulund Design Pattern™" slaididelt. *)
open OUnit2
open Fixpoint

module Transition =
struct
  type t = int * string * int [@@deriving ord, show]
end

module TransitionSet =
struct
  include Set.Make (Transition) (* Taaskasutame standardset hulga moodulit. *)
  (* Aga lisame mõne funktsiooni juurde. *)

  (** Relatsioonide kompositsioon. *)
  let compose rel1 rel2 =
    fold (fun (s1, l1, t1) acc ->
        fold (fun (s2, l2, t2) acc ->
            if t1 = s2 then
              add (s1, l1 ^ l2, t2) acc
            else
              acc
          ) rel2 acc
      ) rel1 empty

  let show ts = [%show: Transition.t list] (elements ts)
end

(** Algne relatsioon. *)
let initial = TransitionSet.of_list [
  (0, "a", 1);
  (1, "b", 2);
  (1, "c", 3);
  (3, "d", 4);
]

(** Oodatav transitiivne sulund. *)
let expected = TransitionSet.of_list [
  (0, "a", 1);
  (1, "b", 2);
  (1, "c", 3);
  (3, "d", 4);
  (0, "ab", 2);
  (0, "ac", 3);
  (1, "cd", 4);
  (0, "acd", 4);
]

module TransitionSetFP = MakeSet (TransitionSet)

let assert_equal = assert_equal ~cmp:TransitionSet.equal ~printer:TransitionSet.show

let test_fp _ =
  let f ts = TransitionSet.union initial (TransitionSet.compose ts initial) in
  assert_equal expected (TransitionSetFP.fp f TransitionSet.empty)

let test_lfp _ =
  let f ts = TransitionSet.union initial (TransitionSet.compose ts initial) in
  assert_equal expected (TransitionSetFP.lfp f)

let test_closure _ =
  let f ts = TransitionSet.compose ts initial in
  assert_equal expected (TransitionSetFP.closure f initial)

let tests =
  "transition" >::: [
    "fp" >:: test_fp;
    "lfp" >:: test_lfp;
    "closure" >:: test_closure;
  ]
