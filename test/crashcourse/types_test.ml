open OUnit2
open Crashcourse.Types

let test_show_color _ =
  let assert_equal = assert_equal ~printer:Fun.id in
  assert_equal "R" (show_color Red);
  assert_equal "G" (show_color Green);
  assert_equal "B" (show_color Blue)

let test_parse_color _ =
  let assert_equal = assert_equal ~printer:show_color in
  assert_equal Red (parse_color "R");
  assert_equal Green (parse_color "G");
  assert_equal Blue (parse_color "B");
  assert_raises (Failure "parse_color: invalid input") (fun () -> parse_color "X")

let test_height _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 4 (height example_int_tree);
  assert_equal 2 (height example_char_tree)

let show_int_tree = show_tree string_of_int
let show_char_tree = show_tree (String.make 1)

let test_show_tree _ =
  let assert_equal = assert_equal ~printer:Fun.id in
  assert_equal "(1 (((2 3) 4) 5))" (show_int_tree example_int_tree);
  assert_equal "((a b) (b a))" (show_char_tree example_char_tree)

let test_tree_map _ =
  assert_equal ~printer:show_int_tree (Branch (Leaf 2, Branch (Branch (Branch (Leaf 3, Leaf 4), Leaf 5), Leaf 6))) (tree_map (fun x -> x + 1) example_int_tree);
  assert_equal ~printer:show_char_tree (Branch (Branch (Leaf 'A', Leaf 'B'), Branch (Leaf 'B', Leaf 'A'))) (tree_map Char.uppercase_ascii example_char_tree)

let test_leaves _ =
  let assert_equal = assert_equal ~printer:string_of_int in
  assert_equal 5 (leaves example_int_tree);
  assert_equal 4 (leaves example_char_tree)

let test_tree_mirror _ =
  assert_equal ~printer:show_int_tree (Branch (Branch (Leaf 5, Branch (Leaf 4, Branch (Leaf 3, Leaf 2))), Leaf 1)) (tree_mirror example_int_tree);
  assert_equal ~printer:show_char_tree example_char_tree (tree_mirror example_char_tree)

let test_tree_left _ =
  assert_equal ~printer:string_of_int 1 (tree_left example_int_tree);
  assert_equal ~printer:[%show: char] 'a' (tree_left example_char_tree)

let tests =
  "types" >::: [
    "enum" >::: [
      "show_color" >:: test_show_color;
      "parse_color" >:: test_parse_color;
    ];
    "adt" >::: [
      "examples" >::: [
        "height" >:: test_height;
        "show_tree" >:: test_show_tree;
        "tree_map" >:: test_tree_map;
      ];
      "problems" >::: [
        "leaves" >:: test_leaves;
        "tree_mirror" >:: test_tree_mirror;
        "tree_left" >:: test_tree_left;
      ];
    ];
  ]
