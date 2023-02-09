(lang dune 2.9)
(name aktsp2023)

(source (github sws-lab/aktsp2023))
(authors "Simmo Saan")
(maintainers "Simmo Saan")

(generate_opam_files true)

(package
 (name aktsp2023)
 (synopsis "AKT süvenduspraktikumi 2023 materjalid")
 (depends
  ocamlgraph
  ppx_deriving
  ppx_deriving_hash
  ounit2
  ocaml-lsp-server
  utop))
