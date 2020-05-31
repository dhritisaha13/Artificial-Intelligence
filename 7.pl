append([],L2,L2).
append([X|L1],L2,[X|L]):-append(L1,L2,L).

preorder(nil,[]).
preorder(bt(Left,Root,Right),L):-
	preorder(Left,L1),
	preorder(Right,L2),
	append([Root|L1],L2,L).
