open OUnit2
open Crashcourse.Basics

let test_inc _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 5 (inc 4);
  assert_equal 1 (inc 0)

let test_inc' _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 5 (inc' 4);
  assert_equal 1 (inc' 0)

let test_fact _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 1 (fact 0);
  assert_equal 1 (fact 1);
  assert_equal 2 (fact 2);
  assert_equal 6 (fact 3);
  assert_equal 24 (fact 4);
  assert_equal 120 (fact 5)

let test_fact' _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 1 (fact' 0);
  assert_equal 1 (fact' 1);
  assert_equal 2 (fact' 2);
  assert_equal 6 (fact' 3);
  assert_equal 24 (fact' 4);
  assert_equal 120 (fact' 5)

let test_gcd _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 1 (gcd 3 5);
  assert_equal 3 (gcd 3 9);
  assert_equal 3 (gcd 9 6);
  assert_equal 6 (gcd 12 18)

let test_implies _ =
  let assert_equal = assert_equal ~printer:string_of_bool in
  assert_equal true (implies false false);
  assert_equal true (implies false true);
  assert_equal false (implies true false);
  assert_equal true (implies true true)

let test_inc3 _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 7 (inc3 4);
  assert_equal 3 (inc3 0)

let test_triangular _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 0 (triangular 0);
  assert_equal 1 (triangular 1);
  assert_equal 3 (triangular 2);
  assert_equal 6 (triangular 3);
  assert_equal 10 (triangular 4)

let test_pow _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 1 (pow 2 0);
  assert_equal 2 (pow 2 1);
  assert_equal 4 (pow 2 2);
  assert_equal 8 (pow 2 3);
  assert_equal 16 (pow 2 4);
  assert_equal 9 (pow 3 2)

let test_is_vowel _ =
  let assert_equal = assert_equal ~printer:string_of_bool in
  assert_equal true (is_vowel 'a');
  assert_equal true (is_vowel 'e');
  assert_equal true (is_vowel 'i');
  assert_equal true (is_vowel 'o');
  assert_equal true (is_vowel 'u');
  assert_equal false (is_vowel 'x');
  assert_equal false (is_vowel 'm');
  assert_equal false (is_vowel 'b')

let test_is_vowel' _ =
  let assert_equal = assert_equal ~printer:string_of_bool in
  assert_equal true (is_vowel' 'a');
  assert_equal true (is_vowel' 'e');
  assert_equal true (is_vowel' 'i');
  assert_equal true (is_vowel' 'o');
  assert_equal true (is_vowel' 'u');
  assert_equal false (is_vowel' 'x');
  assert_equal false (is_vowel' 'm');
  assert_equal false (is_vowel' 'b')

let test_xor _ =
  let assert_equal = assert_equal ~printer:string_of_bool in
  assert_equal false (xor false false);
  assert_equal true (xor false true);
  assert_equal true (xor true false);
  assert_equal false (xor true true)

let tests =
  "basics" >::: [
    "examples" >::: [
      "inc" >:: test_inc;
      "inc'" >:: test_inc';
      "fact" >:: test_fact;
      "fact'" >:: test_fact';
      "gcd" >:: test_gcd;
      "implies" >:: test_implies;
    ];
    "problems" >::: [
      "inc3" >:: test_inc3;
      "triangular" >:: test_triangular;
      "pow" >:: test_pow;
      "is_vowel" >:: test_is_vowel;
      "is_vowel'" >:: test_is_vowel';
      "xor" >:: test_xor;
    ];
  ]
