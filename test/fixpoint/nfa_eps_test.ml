(** Epsilonsulundi näide "Introduction to Compiler Design" õpikust, peatükk 1.5.1. *)
open OUnit2
open Fixpoint

module IntSet = Set.Make (Int)

let show_intset is = [%show: int list] (IntSet.elements is)

(** Epsilonsammude funktsioon, joonis 1.5. *)
let nfa_eps = function
  | 1 -> [2; 5]
  | 5 -> [6; 7]
  | 8 -> [1]
  | _ -> []

(** Epsilonsammude funktsioon hulgal. *)
let nfa_eps_set states =
  IntSet.elements states
  |> List.concat_map nfa_eps
  |> IntSet.of_list

module IntSetFP = MakeSet (IntSet)

let assert_equal = assert_equal ~cmp:IntSet.equal ~printer:show_intset

let test_fp _ =
  (* Olekust 1. *)
  let f1 x = IntSet.union (IntSet.singleton 1) (nfa_eps_set x) in
  assert_equal (IntSet.of_list [1; 2; 5; 6; 7]) (IntSetFP.fp f1 IntSet.empty);
  (* Olekust 2. *)
  let f2 x = IntSet.union (IntSet.singleton 2) (nfa_eps_set x) in
  assert_equal (IntSet.of_list [2]) (IntSetFP.fp f2 IntSet.empty);
  (* Olekust 8. *)
  let f8 x = IntSet.union (IntSet.singleton 8) (nfa_eps_set x) in
  assert_equal (IntSet.of_list [1; 2; 5; 6; 7; 8]) (IntSetFP.fp f8 IntSet.empty)

let test_lfp _ =
  (* Olekust 1. *)
  let f1 x = IntSet.union (IntSet.singleton 1) (nfa_eps_set x) in
  assert_equal (IntSet.of_list [1; 2; 5; 6; 7]) (IntSetFP.lfp f1);
  (* Olekust 2. *)
  let f2 x = IntSet.union (IntSet.singleton 2) (nfa_eps_set x) in
  assert_equal (IntSet.of_list [2]) (IntSetFP.lfp f2);
  (* Olekust 8. *)
  let f8 x = IntSet.union (IntSet.singleton 8) (nfa_eps_set x) in
  assert_equal (IntSet.of_list [1; 2; 5; 6; 7; 8]) (IntSetFP.lfp f8)

let test_closure _ =
  (* Olekust 1. *)
  assert_equal (IntSet.of_list [1; 2; 5; 6; 7]) (IntSetFP.closure nfa_eps_set (IntSet.singleton 1));
  (* Olekust 2. *)
  assert_equal (IntSet.of_list [2]) (IntSetFP.closure nfa_eps_set (IntSet.singleton 2));
  (* Olekust 8. *)
  assert_equal (IntSet.of_list [1; 2; 5; 6; 7; 8]) (IntSetFP.closure nfa_eps_set (IntSet.singleton 8))

let tests =
  "nfa_eps" >::: [
    "fp" >:: test_fp;
    "lfp" >:: test_lfp;
    "closure" >:: test_closure;
  ]
