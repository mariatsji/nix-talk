let
  increase = x: x + 1;
  myList = [ (increase 2) "world" false ];

in { result = "Hello ${builtins.elemAt myList 1}"; }
