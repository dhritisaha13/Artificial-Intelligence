insertbst(X,nil,bst(nil,X,nil)).
insertbst(X,bst(Left,Root,Right),bst(Left1,Root,Right)):-
	X=<Root,!,insertbst(X,Left,Left1).
insertbst(X,bst(Left,Root,Right),bst(Left,Root,Right1)):-
	X>Root,insertbst(X,Right,Right1).

