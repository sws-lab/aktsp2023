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
module Program1: ProgramModel =
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
module Program2: ProgramModel =
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
module Program3 =
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

(** Mudel parandatud Program3 jaoks. *)
module Program4: ProgramModel =
struct
  include Program3 (* Ei pea kõike kopeerima. *)

  let step ((point, env): t): t list =
    match point with (* Siin saab üle defineerida ühe juhu. *)

    | _ -> step (point, env)
end
