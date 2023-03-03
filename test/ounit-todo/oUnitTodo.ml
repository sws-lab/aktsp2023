open OUnit2

let wrap = OUnitTest.test_decorate (fun test ->
    fun ctxt ->
      try
        test ctxt
      with Failure "TODO" [@warning "-fragile-literal-pattern"] ->
        todo "unimplemented"
  )
