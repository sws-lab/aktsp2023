open OUnit2
open Crashcourse.Types
open Crashcourse.Collections

let test_list_of_tree _ =
  assert_equal ~printer:[%show: int list] [1; 2; 3; 4; 5] (list_of_tree example_int_tree);
  assert_equal ~printer:[%show: char list] ['a'; 'b'; 'b'; 'a'] (list_of_tree example_char_tree)

let test_list_inc _ =
  assert_equal ~printer:[%show: int list] [2; 3; 4; 5; 6] (list_inc [1; 2; 3; 4; 5])

let test_list_big _ =
  assert_equal ~printer:[%show: int list] [4; 5] (list_big [1; 2; 3; 4; 5])

let test_list_sum _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 15 (list_sum [1; 2; 3; 4; 5]);
  assert_equal 0 (list_sum [])

let test_list_sum' _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 15 (list_sum' [1; 2; 3; 4; 5]);
  assert_equal 0 (list_sum' [])

let test_list_sum'' _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 15 (list_sum'' [1; 2; 3; 4; 5]);
  assert_equal 0 (list_sum'' [])

let test_list_double _ =
  assert_equal ~printer:[%show: int list] [2; 4; 6; 8; 10] (list_double [1; 2; 3; 4; 5])

let test_list_even _ =
  assert_equal ~printer:[%show: int list] [2; 4] (list_even [1; 2; 3; 4; 5])

let test_list_product _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 120 (list_product [1; 2; 3; 4; 5]);
  assert_equal 1 (list_product [])

let show_intset x = [%show: int list] (IntSet.elements x)

let test_intset_of_tree _ =
  assert_equal ~cmp:IntSet.equal ~printer:show_intset (IntSet.of_list [1; 2; 3; 4; 5]) (intset_of_tree example_int_tree)

module IntElement =
struct
  include Int
  let show = string_of_int
end
module IntTree = Tree (IntElement)
let show_intset x = [%show: int list] (IntTree.Set.elements x)

module CharElement =
struct
  include Char
  let show = String.make 1
end
module CharTree = Tree (CharElement)
let show_charset x = [%show: char list] (CharTree.Set.elements x)

let test_tree_to_set _ =
  assert_equal ~cmp:IntTree.Set.equal ~printer:show_intset (IntTree.Set.of_list [1; 2; 3; 4; 5]) (IntTree.to_set example_int_tree);
  assert_equal ~cmp:CharTree.Set.equal ~printer:show_charset (CharTree.Set.of_list ['a'; 'b']) (CharTree.to_set example_char_tree)

let test_tree_show _ =
  let assert_equal = assert_equal ~printer:Fun.id in
  assert_equal "(1 (((2 3) 4) 5))" (IntTree.show example_int_tree);
  assert_equal "((a b) (b a))" (CharTree.show example_char_tree)

let tests =
  "collections" >::: [
    "lists" >::: [
      "examples" >::: [
        "list_of_tree" >:: test_list_of_tree;
        "list_inc" >:: test_list_inc;
        "list_big" >:: test_list_big;
        "list_sum" >:: test_list_sum;
        "list_sum'" >:: test_list_sum';
        "list_sum''" >:: test_list_sum'';
      ];
      "problems" >::: [
        "list_double" >:: test_list_double;
        "list_even" >:: test_list_even;
        "list_product" >:: test_list_product;
      ];
    ];
    "sets" >::: [
      "intset_of_tree" >:: test_intset_of_tree;
      "tree" >::: [
        "tree_to_set" >:: test_tree_to_set;
        "show" >:: test_tree_show;
      ];
    ];
  ]
