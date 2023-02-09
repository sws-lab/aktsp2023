# AKT süvenduspraktikum 2023

[AKT süvenduspraktikumi 2023](https://courses.cs.ut.ee/2023/AKTSP/spring) materjalide repositoorium.


## Paigaldamine
1. Sõltuvalt operatsioonisüsteemist:
    * Windows: paigalda [WSL](https://docs.microsoft.com/en-us/windows/wsl/install). **Edasi tööta WSL-is.**
    * Linux: ära tee midagi, tegid juba õige valiku!
    * MacOS: paigalda [homebrew](https://brew.sh/).
2. Paigalda [opam](https://opam.ocaml.org/doc/Install.html).
3. Paigalda [Visual Studio Code](https://code.visualstudio.com/) ja [OCaml Platform laiendus](https://marketplace.visualstudio.com/items?itemName=ocamllabs.ocaml-platform).
4. [Git](https://git-scm.com/downloads)-iga klooni [see repositoorium](https://github.com/sws-lab/aktsp2023).
    * NB! Windows-is klooni repositoorium WSL-i sees, mitte väljaspool, sest muidu toimub OCaml-i kompileerimine väga aeglaselt.
5. Navigeeri käsureal kloonitud repositooriumi kausta.
6. Käivita: `opam init -a --bare -y`
7. Käivita: `opam switch create --deps-only --locked -y .` (NB! punkt)

### Paigalduse kontrollimine
1. Käivita: `eval $(opam env)`
2. Käivita: `dune exec src/hello/hello.exe`
    * Väljund peaks olema `Hello, OCaml!`.


## Kasutamine
1. Navigeeri käsureal kloonitud projekti repositooriumi kausta.
2. Käivita: `eval $(opam env)`
3. Käivita: `code .` (NB! punkt)
4. Käivita
    * Kompileerimiseks: `dune build`
    * Jooksvalt testimiseks: `dune runtest -w`
    * Interaktiivselt kasutamiseks: `dune utop`
