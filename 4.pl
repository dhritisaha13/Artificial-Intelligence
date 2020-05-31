checkbst(nil).
checkbst(bst(Left,Root,Right)):-range(bst(Left,Root,Right),0,100).
range(nil,_,_).
range(bst(Left,Root,Right),L,R):-L=<Root,Root=<R,range(Left,L,Root),range(Right,Root,R).
