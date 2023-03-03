open OUnit2
open Modelcheck

module BadModel =
struct
  type t = int [@@deriving ord, show]

  let initial = 42

  let step i =
    if i >= 0 then
      [i - 1; i - 2; i - 3]
    else
      []

  let is_error i = i < 0
end

module BadModelChecker = Checker.MakeNaive (BadModel)

let test_bad_correct _ =
  assert_equal ~printer:string_of_bool true (BadModelChecker.has_error ());
  assert_equal ~printer:string_of_bool false (BadModelChecker.is_correct ())

let test_bad_all_states _ =
  let all_states = BadModelChecker.all_states () in
  assert_equal ~printer:string_of_int 46 (BadModelChecker.StateSet.cardinal all_states)

let test_bad_error_states _ =
  let error_states = BadModelChecker.error_states () in
  (* Kommenteeri järgmine rida sisse, et näha üht veaolekut. *)
  (* Format.printf "BadModel error state: %d\n" (BadModelChecker.StateSet.choose error_states); *)
  assert_equal ~printer:string_of_int 3 (BadModelChecker.StateSet.cardinal error_states)


module GoodModel =
struct
  type t = int [@@deriving ord, show]

  let initial = 42

  let step i =
    if i >= 3 then
      [i - 1; i - 2; i - 3]
    else
      []

  let is_error i = i < 0
end

module GoodModelChecker = Checker.MakeNaive (GoodModel)

let test_good_correct _ =
  assert_equal ~printer:string_of_bool false (GoodModelChecker.has_error ());
  assert_equal ~printer:string_of_bool true (GoodModelChecker.is_correct ())

let test_good_all_states _ =
  let all_states = GoodModelChecker.all_states () in
  assert_equal ~printer:string_of_int 43 (GoodModelChecker.StateSet.cardinal all_states)

let test_good_error_states _ =
  let error_states = GoodModelChecker.error_states () in
  assert_equal ~printer:string_of_int 0 (GoodModelChecker.StateSet.cardinal error_states)


let tests =
  "modelcheck" >::: [
    "bad" >::: [
      "correct" >:: test_bad_correct;
      "all_states" >:: test_bad_all_states;
      "error_states" >:: test_bad_error_states;
    ];
    "good" >::: [
      "correct" >:: test_good_correct;
      "all_states" >:: test_good_all_states;
      "error_states" >:: test_good_error_states;
    ];
  ]

let () = run_test_tt_main (OUnitTodo.wrap tests)
