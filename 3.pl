binarytree(nil).
binarytree(bt(Left,Root,Right)):-
	binarytree(Left),binarytree(Right).

