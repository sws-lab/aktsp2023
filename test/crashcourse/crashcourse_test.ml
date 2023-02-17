open OUnit2

let tests =
  "crashcourse" >::: [
    Basics_test.tests;
    Types_test.tests;
    Collections_test.tests;
  ]

let () = run_test_tt_main (OUnitTodo.wrap tests)
