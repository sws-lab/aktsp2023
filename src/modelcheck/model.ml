module type Model =
sig
  (** Oleku tüüp. *)
  type t [@@deriving ord]

  (** Algolek. *)
  val initial: t

  (** Tagastab olekule järgnevad võimalikud olekud. *)
  val step: t -> t list

  (** Kontrollib, kas on veaolek. *)
  val is_error: t -> bool
end
