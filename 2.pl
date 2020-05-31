in_bst(X,bst(nil,X,nil)).
in_bst(X,bst(_,X,_)).
in_bst(X,bst(Left,Root,Right)):-
	X<Root,in_bst(X,Left),!;
	X>Root,in_bst(X,Right).

