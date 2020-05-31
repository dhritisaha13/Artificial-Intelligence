maxbst(bst(_,X,nil),X).
maxbst(bst(Left,Root,Right),X):-
	maxbst(Right,X).
