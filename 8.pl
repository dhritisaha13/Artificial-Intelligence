append([],L2,L2).
append([X|L1],L2,[X|L]):-append(L1,L2,L).

inorder(nil,[]).
inorder(bt(Left,Root,Right),L):-
	inorder(Left,L1),
	inorder(Right,L2),
	append(L1,[Root|L2],L).

