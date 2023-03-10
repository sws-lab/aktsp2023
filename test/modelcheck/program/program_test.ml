open OUnit2
open Modelcheck_program

(** Abifunktsioon keskkondade kuvamiseks. *)
let pp_env ppf env =
  let pp_pair ppf (x, i) = Format.fprintf ppf "%s→%d" x i in
  let pp_sep ppf () = Format.fprintf ppf ", " in
  Format.fprintf ppf "{%a}" (Format.pp_print_list ~pp_sep pp_pair) (Env.bindings env)


module ExampleProgramChecker = Modelcheck.Checker.MakeNaive (ExampleProgram)

let test_example_correct _ =
  assert_equal ~printer:string_of_bool false (ExampleProgramChecker.is_correct ())

let test_example_all_states _ =
  let all_states = ExampleProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 1345 (ExampleProgramChecker.StateSet.cardinal all_states)

let test_example_error_states _ =
  let error_states = ExampleProgramChecker.error_states () in
  (* Kommenteeri järgmine rida sisse, et näha üht veaolekut. *)
  (* Format.printf "ExampleProgram error state: %s\n" ([%show: ExampleProgram.point * env] (ExampleProgramChecker.StateSet.choose error_states)); *)
  assert_equal ~printer:string_of_int 5 (ExampleProgramChecker.StateSet.cardinal error_states)


module CountUpProgramChecker = Modelcheck.Checker.MakeNaive (CountUpProgram)

let test_count_up_correct _ =
  assert_equal ~printer:string_of_bool true (CountUpProgramChecker.is_correct ())

let test_count_up_all_states _ =
  let all_states = CountUpProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 5528 (CountUpProgramChecker.StateSet.cardinal all_states)

let test_count_up_error_states _ =
  let error_states = CountUpProgramChecker.error_states () in
  assert_equal ~printer:string_of_int 0 (CountUpProgramChecker.StateSet.cardinal error_states)


(* module PowProgramChecker = Modelcheck.Checker.MakeNaive (PowProgram)

let test_pow_correct _ =
  assert_equal ~printer:string_of_bool false (PowProgramChecker.is_correct ())

let test_pow_all_states _ =
  let all_states = PowProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 367 (PowProgramChecker.StateSet.cardinal all_states)

let test_pow_error_states _ =
  let error_states = PowProgramChecker.error_states () in
  (* Kommenteeri järgmine rida sisse, et näha üht veaolekut. *)
  (* Format.printf "PowProgram error state: %s\n" ([%show: PowProgram.point * env] (PowProgramChecker.StateSet.choose error_states)); *)
  assert_equal ~printer:string_of_int 8 (PowProgramChecker.StateSet.cardinal error_states)


module FixedPowProgramChecker = Modelcheck.Checker.MakeNaive (FixedPowProgram)

let test_fixed_pow_correct _ =
  assert_equal ~printer:string_of_bool true (FixedPowProgramChecker.is_correct ())

let test_fixed_pow_all_states _ =
  let all_states = FixedPowProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 313 (FixedPowProgramChecker.StateSet.cardinal all_states)

let test_fixed_pow_error_states _ =
  let error_states = FixedPowProgramChecker.error_states () in
  assert_equal ~printer:string_of_int 0 (FixedPowProgramChecker.StateSet.cardinal error_states) *)


module CountUpDownProgramChecker = Modelcheck.Checker.MakeNaive (CountUpDownProgram)

let test_count_up_down_correct _ =
  assert_equal ~printer:string_of_bool true (CountUpDownProgramChecker.is_correct ())

let test_count_up_down_all_states _ =
  let all_states = CountUpDownProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 409 (CountUpDownProgramChecker.StateSet.cardinal all_states)

let test_count_up_down_error_states _ =
  let error_states = CountUpDownProgramChecker.error_states () in
  assert_equal ~printer:string_of_int 0 (CountUpDownProgramChecker.StateSet.cardinal error_states)


module SumProgramChecker = Modelcheck.Checker.MakeNaive (SumProgram)

let test_sum_correct _ =
  assert_equal ~printer:string_of_bool false (SumProgramChecker.is_correct ())

let test_sum_all_states _ =
  let all_states = SumProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 348 (SumProgramChecker.StateSet.cardinal all_states)

let test_sum_error_states _ =
  let error_states = SumProgramChecker.error_states () in
  (* Kommenteeri järgmine rida sisse, et näha üht veaolekut. *)
  (* Format.printf "SumProgram error state: %s\n" ([%show: SumProgram.point * env] (SumProgramChecker.StateSet.choose error_states)); *)
  assert_equal ~printer:string_of_int 15 (SumProgramChecker.StateSet.cardinal error_states)


module FixedSumProgramChecker = Modelcheck.Checker.MakeNaive (FixedSumProgram)

let test_fixed_sum_correct _ =
  assert_equal ~printer:string_of_bool true (FixedSumProgramChecker.is_correct ())

let test_fixed_sum_all_states _ =
  let all_states = FixedSumProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 393 (FixedSumProgramChecker.StateSet.cardinal all_states)

let test_fixed_sum_error_states _ =
  let error_states = FixedSumProgramChecker.error_states () in
  assert_equal ~printer:string_of_int 0 (FixedSumProgramChecker.StateSet.cardinal error_states)


(* module LinearSqrtProgramChecker = Modelcheck.Checker.MakeNaive (LinearSqrtProgram)

let test_linear_sqrt_correct _ =
  assert_equal ~printer:string_of_bool true (LinearSqrtProgramChecker.is_correct ())

let test_linear_sqrt_all_states _ =
  let all_states = LinearSqrtProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 537 (LinearSqrtProgramChecker.StateSet.cardinal all_states)

let test_linear_sqrt_error_states _ =
  let error_states = LinearSqrtProgramChecker.error_states () in
  assert_equal ~printer:string_of_int 0 (LinearSqrtProgramChecker.StateSet.cardinal error_states)


module BinarySqrtProgramChecker = Modelcheck.Checker.MakeNaive (BinarySqrtProgram)

let test_binary_sqrt_correct _ =
  assert_equal ~printer:string_of_bool true (BinarySqrtProgramChecker.is_correct ())

let test_binary_sqrt_all_states _ =
  let all_states = BinarySqrtProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 1046 (BinarySqrtProgramChecker.StateSet.cardinal all_states)

let test_binary_sqrt_error_states _ =
  let error_states = BinarySqrtProgramChecker.error_states () in
  assert_equal ~printer:string_of_int 0 (BinarySqrtProgramChecker.StateSet.cardinal error_states)


module NewtonSqrtProgramChecker = Modelcheck.Checker.MakeNaive (NewtonSqrtProgram)

let test_newton_sqrt_correct _ =
  assert_equal ~printer:string_of_bool true (NewtonSqrtProgramChecker.is_correct ())

let test_newton_sqrt_all_states _ =
  let all_states = NewtonSqrtProgramChecker.all_states () in
  assert_equal ~printer:string_of_int 558 (NewtonSqrtProgramChecker.StateSet.cardinal all_states)

let test_newton_sqrt_error_states _ =
  let error_states = NewtonSqrtProgramChecker.error_states () in
  assert_equal ~printer:string_of_int 0 (NewtonSqrtProgramChecker.StateSet.cardinal error_states) *)


let tests =
  "modelcheck" >::: [
    "program" >::: [
      "example" >::: [
        "correct" >:: test_example_correct;
        "all_states" >:: test_example_all_states;
        "error_states" >:: test_example_error_states;
      ];
      "count_up" >::: [
        "correct" >:: test_count_up_correct;
        "all_states" >:: test_count_up_all_states;
        "error_states" >:: test_count_up_error_states;
      ];
      (* "pow" >::: [
        "correct" >:: test_pow_correct;
        "all_states" >:: test_pow_all_states;
        "error_states" >:: test_pow_error_states;
        "fixed" >::: [
          "correct" >:: test_fixed_pow_correct;
          "all_states" >:: test_fixed_pow_all_states;
          "error_states" >:: test_fixed_pow_error_states;
        ];
      ]; *)
      "count_up_down" >::: [
        "correct" >:: test_count_up_down_correct;
        "all_states" >:: test_count_up_down_all_states;
        "error_states" >:: test_count_up_down_error_states;
      ];
      "sum" >::: [
        "correct" >:: test_sum_correct;
        "all_states" >:: test_sum_all_states;
        "error_states" >:: test_sum_error_states;
        "fixed" >::: [
          "correct" >:: test_fixed_sum_correct;
          "all_states" >:: test_fixed_sum_all_states;
          "error_states" >:: test_fixed_sum_error_states;
        ];
      ];
      (* "sqrt" >::: [
        "linear" >::: [
          "correct" >:: test_linear_sqrt_correct;
          "all_states" >:: test_linear_sqrt_all_states;
          "error_states" >:: test_linear_sqrt_error_states;
        ];
        "binary" >::: [
          "correct" >:: test_binary_sqrt_correct;
          "all_states" >:: test_binary_sqrt_all_states;
          "error_states" >:: test_binary_sqrt_error_states;
        ];
        "newton" >::: [
          "correct" >:: test_newton_sqrt_correct;
          "all_states" >:: test_newton_sqrt_all_states;
          "error_states" >:: test_newton_sqrt_error_states;
        ];
      ]; *)
    ];
  ]

let () = run_test_tt_main (OUnitTodo.wrap tests)
