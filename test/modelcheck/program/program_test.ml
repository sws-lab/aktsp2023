open OUnit2
open Modelcheck_program

(** Abifunktsioon keskkondade kuvamiseks. *)
let pp_env ppf env =
  let pp_pair ppf (x, i) = Format.fprintf ppf "%s→%d" x i in
  let pp_sep ppf () = Format.fprintf ppf ", " in
  Format.fprintf ppf "{%a}" (Format.pp_print_list ~pp_sep pp_pair) (Env.bindings env)


module Program1Checker = Modelcheck.Checker.MakeNaive (Program1)

let test_program1_correct _ =
  assert_equal ~printer:string_of_bool false (Program1Checker.is_correct ())

let test_program1_all_states _ =
  let all_states = Program1Checker.all_states () in
  assert_equal ~printer:string_of_int 1345 (Program1Checker.StateSet.cardinal all_states)

let test_program1_error_states _ =
  let error_states = Program1Checker.error_states () in
  (* Kommenteeri järgmine rida sisse, et näha üht veaolekut. *)
  (* Format.printf "Program1 error state: %s\n" ([%show: Program1.point * env] (Program1Checker.StateSet.choose error_states)); *)
  assert_equal ~printer:string_of_int 5 (Program1Checker.StateSet.cardinal error_states)


module Program2Checker = Modelcheck.Checker.MakeNaive (Program2)

let test_program2_correct _ =
  assert_equal ~printer:string_of_bool true (Program2Checker.is_correct ())

let test_program2_all_states _ =
  let all_states = Program2Checker.all_states () in
  assert_equal ~printer:string_of_int 5528 (Program2Checker.StateSet.cardinal all_states)

let test_program2_error_states _ =
  let error_states = Program2Checker.error_states () in
  assert_equal ~printer:string_of_int 0 (Program2Checker.StateSet.cardinal error_states)


module Program3Checker = Modelcheck.Checker.MakeNaive (Program3)

let test_program3_correct _ =
  assert_equal ~printer:string_of_bool false (Program3Checker.is_correct ())

let test_program3_all_states _ =
  let all_states = Program3Checker.all_states () in
  assert_equal ~printer:string_of_int 367 (Program3Checker.StateSet.cardinal all_states)

let test_program3_error_states _ =
  let error_states = Program3Checker.error_states () in
  (* Kommenteeri järgmine rida sisse, et näha üht veaolekut. *)
  (* Format.printf "Program3 error state: %s\n" ([%show: Program3.point * env] (Program3Checker.StateSet.choose error_states)); *)
  assert_equal ~printer:string_of_int 8 (Program3Checker.StateSet.cardinal error_states)


module Program4Checker = Modelcheck.Checker.MakeNaive (Program4)

let test_program4_correct _ =
  assert_equal ~printer:string_of_bool true (Program4Checker.is_correct ())

let test_program4_all_states _ =
  let all_states = Program4Checker.all_states () in
  assert_equal ~printer:string_of_int 313 (Program4Checker.StateSet.cardinal all_states)

let test_program4_error_states _ =
  let error_states = Program4Checker.error_states () in
  assert_equal ~printer:string_of_int 0 (Program4Checker.StateSet.cardinal error_states)


let tests =
  "modelcheck" >::: [
    "program" >::: [
      "program1" >::: [
        "correct" >:: test_program1_correct;
        "all_states" >:: test_program1_all_states;
        "error_states" >:: test_program1_error_states;
      ];
      "program2" >::: [
        "correct" >:: test_program2_correct;
        "all_states" >:: test_program2_all_states;
        "error_states" >:: test_program2_error_states;
      ];
      "program3" >::: [
        "correct" >:: test_program3_correct;
        "all_states" >:: test_program3_all_states;
        "error_states" >:: test_program3_error_states;
      ];
      "program4" >::: [
        "correct" >:: test_program4_correct;
        "all_states" >:: test_program4_all_states;
        "error_states" >:: test_program4_error_states;
      ];
    ];
  ]

let () = run_test_tt_main (OUnitTodo.wrap tests)
