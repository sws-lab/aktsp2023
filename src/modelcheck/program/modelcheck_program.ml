(** Programmide mudelkontroll. *)
open Modelcheck

(** Väärtuskeskkond.
    Muutujate nimed on sõned ja väärtused täisarvud. *)
module Env = Map.Make (String)
type env = int Env.t [@@deriving ord]

module type ProgramModel =
sig
  (** Programmi mudeli olekud koosnevad programmi punktist ja keskkonnast. *)
  type point [@@deriving ord, show]
  include Model with type t = point * env
end

(** Abifunktsioon juhuarvu step funktsiooni implementeerimiseks. *)
let nondet (point': 'a) (x: string) ((l, u): int * int) env: ('a * env) list =
  List.init (u - l + 1) (fun i ->
      (point', Env.add x (l + i) env)
    )

(** Mudel järgmise programmi jaoks:

    1:  int x = 1;
    2:  int y = __VERIFIER_nondet_int(); // -10..10
    3:  int z = __VERIFIER_nondet_int(); // -10..10
    4:  if (z > 5)
    5:    x = y;
    6:  else
    7:    x++;
    8:  assert(x != 0); // kas võib ebaõnnestuda?

    *)
module ExampleProgram: ProgramModel =
struct
  type point = P2 | P3 | P4 | P5 | P7 | P8 [@@deriving ord, show]
  type t = point * env [@@deriving ord]

  let initial: t = (P2, Env.singleton "x" 1)

  let step ((point, env): t): t list =
    failwith "TODO"

  let is_error ((point, env): t): bool =
    failwith "TODO"
end

(** Mudel järgmise programmi jaoks:

    1:  unsigned int x = __VERIFIER_nondet_uint(); // 0..1500
    2:  unsigned int y = x;
    3:  while (x < 1024) {
    4:    x++;
    5:    y++;
    6:  }
    7:  assert(x == y); // kas võib ebaõnnestuda?

    *)
module CountUpProgram: ProgramModel =
struct
  type point = P1 | P2 | P3 | P4 | P5 | P7 [@@deriving ord, show]
  type t = point * env [@@deriving ord]

  let initial: t = (P1, Env.empty)

  let step ((point, env): t): t list =
    failwith "TODO"

  let is_error ((point, env): t): bool =
    failwith "TODO"
end

(** Mudel järgmise programmi jaoks:

    1:  unsigned int y = 1;
    2:  unsigned int x0 = __VERIFIER_nondet_uint(); // 0..5
    3:  unsigned int n0 = __VERIFIER_nondet_uint(); // 1..5
    4:  unsigned int x = x0;
    5:  unsigned int n = n0;
    6:  while (n > 1) {
    7:    if (n % 2 == 0)
    8:      n = n / 2;
    9:    else {
    10:     y = x * y;
    11:     n = (n + 1) / 2;
    12:   }
    13:   x = x * x;
    14: }
    15: y = x * y;
    16: assert(y == pow(x0, n0)); // kas võib ebaõnnestuda?

    *)
module PowProgram =
struct
  type point = P2 | P3 | P4 | P5 | P6 | P7 | P8 | P10 | P11 | P13 | P15 | P16 [@@deriving ord, show]
  type t = point * env [@@deriving ord]

  let initial: t = (P2, Env.singleton "y" 1)

  let step ((point, env): t): t list =
    failwith "TODO"

  (** Vihje: Kasuta Crashcourse.Basics.pow funktsiooni. *)
  let is_error ((point, env): t): bool =
    failwith "TODO"
end

(** Mudel parandatud PowProgram jaoks. *)
module FixedPowProgram: ProgramModel =
struct
  include PowProgram (* Ei pea kõike kopeerima. *)

  let step ((point, env): t): t list =
    match point with (* Siin saab üle defineerida ühe juhu. *)

    | _ -> step (point, env)
end

(** Mudel järgmise programmi jaoks:

    1:  unsigned int y = 0;
    2:  unsigned int n = __VERIFIER_nondet_uint(); // 0..15
    3:  unsigned int x = n;
    4:  while (x > 0) {
    5:    x--;
    6:    y++;
    7:  }
    8:  assert(y == n); // kas võib ebaõnnestuda?

    *)
module CountUpDownProgram: ProgramModel =
struct
  type point = P2 | P3 | P4 | P5 | P6 | P8 [@@deriving ord, show]
  type t = point * env [@@deriving ord]

  let initial: t = (P2, Env.singleton "y" 0)

  let step ((point, env): t): t list =
    failwith "TODO"

  let is_error ((point, env): t): bool =
    failwith "TODO"
end

(** Mudel järgmise programmi jaoks:

    1:  unsigned int sum = 0;
    2:  unsigned int i = 1;
    3:  unsigned int n = __VERIFIER_nondet_uint(); // 0..15
    4:  while (i < n) {
    5:    sum += i;
    6:    i++;
    7:  }
    8:  assert(sum == n * (n + 1) / 2); // kas võib ebaõnnestuda?

    *)
module SumProgram =
struct
  type point = P3 | P4 | P5 | P6 | P8 [@@deriving ord, show]
  type t = point * env [@@deriving ord]

  let initial: t = (P3, Env.add "i" 1 (Env.singleton "sum" 0))

  let step ((point, env): t): t list =
    failwith "TODO"

  let is_error ((point, env): t): bool =
    failwith "TODO"
end

(** Mudel parandatud SumProgram jaoks. *)
module FixedSumProgram: ProgramModel =
struct
  include SumProgram (* Ei pea kõike kopeerima. *)

  let step ((point, env): t): t list =
    match point with (* Siin saab üle defineerida ühe juhu. *)

    | _ -> step (point, env)
end

(** Arvutab ruutjuure täisarvust.
    Vt. https://en.wikipedia.org/wiki/Integer_square_root. *)
let isqrt n =
  int_of_float (sqrt (float_of_int n))

(** Mudel järgmise programmi jaoks:

    1:  unsigned int l = 0;
    2:  unsigned int y = __VERIFIER_nondet_uint(); // 0..50
    3:  while ((l + 1) * (l + 1) <= y)
    4:    l++;
    5:  assert(l == isqrt(y)); // kas võib ebaõnnestuda?

    *)
module LinearSqrtProgram: ProgramModel =
struct
  type point = P2 | P3 | P4 | P5 [@@deriving ord, show]
  type t = point * env [@@deriving ord]

  let initial: t = (P2, Env.singleton "l" 0)

  let step ((point, env): t): t list =
    failwith "TODO"

  (** Vihje: Kasuta ülaldefineeritud isqrt funktsiooni. *)
  let is_error ((point, env): t): bool =
    failwith "TODO"
end

(** Mudel järgmise programmi jaoks:

    1:  unsigned int l = 0;
    2:  unsigned int y = __VERIFIER_nondet_uint(); // 0..50
    3:  unsigned int r = y + 1;
    4:  unsigned int m;
    5:  while (l != r - 1) {
    6:    m = (l + r) / 2;
    7:    if (m * m <= y)
    8:      l = m;
    9:    else
    10:     r = m;
    11: }
    12: assert(l == isqrt(y)); // kas võib ebaõnnestuda?

    *)
module BinarySqrtProgram: ProgramModel =
struct
  type point = P2 | P3 | P5 | P6 | P7 | P8 | P10 | P12 [@@deriving ord, show]
  type t = point * env [@@deriving ord]

  let initial: t = (P2, Env.singleton "l" 0)

  let step ((point, env): t): t list =
    failwith "TODO"

  (** Vihje: Kasuta ülaldefineeritud isqrt funktsiooni. *)
  let is_error ((point, env): t): bool =
    failwith "TODO"
end

(** Mudel järgmise programmi jaoks:

    1:  unsigned int s = __VERIFIER_nondet_uint(); // 0..50
    2:  unsigned int x0;
    3:  if (s <= 1)
    4:    x0 = s;
    5:  else {
    6:    x0 = s / 2;
    7:    unsigned int x1 = (x0 + s / x0) / 2;
    8:    while (x1 < x0) {
    9:      x0 = x1;
    10:     x1 = (x0 + s / x0) / 2;
    11:   }
    12: }
    13: assert(x0 == isqrt(s)); // kas võib ebaõnnestuda?

    *)
module NewtonSqrtProgram: ProgramModel =
struct
  type point = P1 | P3 | P4 | P6 | P7 | P8 | P9 | P10 | P13 [@@deriving ord, show]
  type t = point * env [@@deriving ord]

  let initial: t = (P1, Env.empty)

  let step ((point, env): t): t list =
    failwith "TODO"

  (** Vihje: Kasuta ülaldefineeritud isqrt funktsiooni. *)
  let is_error ((point, env): t): bool =
    failwith "TODO"
end
