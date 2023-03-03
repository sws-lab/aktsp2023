(** Püsipunktid.

    Vt. "Introduction to Compiler Design" õpikust, peatükk 1.5.1.
    Vt. Vesali "The Sulund Design Pattern™" slaide. *)

(** Püsipunktid üle suvalise võrreldava tüübi. *)
module Make (D: sig type t [@@deriving eq] end) =
struct
  (** Leiab funktsiooni püsipunkti alustades iteratsiooni antud väärtusest. *)
  let rec fp (f: D.t -> D.t) (initial: D.t): D.t =
    let next = f initial in
    if D.equal initial next then
      initial
    else
      fp f next
end

(** Püsipunktid üle hulkade. *)
module MakeSet (D: Set.S) =
struct
  include Make (D)

  (** Leiab funktsiooni vähima püsipunkti.
      Kasutada fp funktsiooni. *)
  let lfp (f: D.t -> D.t): D.t =
    fp f D.empty

  (** Leiab funktsiooni sulundi, mis sisaldab antud väärtusi.
      Kasutada lfp funktsiooni. *)
  let closure (f: D.t -> D.t) (initial: D.t): D.t =
    lfp (fun x -> D.union initial (f x))
end


