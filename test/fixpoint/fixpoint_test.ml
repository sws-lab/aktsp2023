open OUnit2

let tests =
  "fixpoint" >::: [
    Transition_test.tests;
    Nfa_eps_test.tests;
  ]

let () = run_test_tt_main (OUnitTodo.wrap tests)
