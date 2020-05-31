deletenode(X,bst(nil,X,nil),nil).
deletenode(X,bst(Left,Root,Right),bst(Left1,Root,Right)):-
	X<Root,!,deletenode(X,Left,Left1).
deletenode(X,bst(Left,Root,Right),bst(Left,Root,Right1)):-
	X>Root,!,deletenode(X,Right,Right1).

deletenode(X,bst(nil,X,Right),Right).
deletenode(X,bst(Left,X,nil),Left).
deletenode(X,bst(Left,X,Right),bst(Left,L,Right1)):-min(Right,L),deletenode(L,Right,Right1).

min(bst(nil,X,_),X).
min(bst(Left,X,Right),M):-min(Left,M).

