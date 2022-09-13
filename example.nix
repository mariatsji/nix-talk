let
  increase = x: x + 1;
  myList = [ 2 "world" false ];

in { result = "Hello ${builtins.elemAt myList 1}"; }
