append([],L2,L2).
append([X|L1],L2,[X|L]):-append(L1,L2,L).

postorder(nil,[]).
postorder(bt(Left,Root,Right),L):-
	postorder(Left,L1),
	postorder(Right,L2),
	append(L2,[Root],L3),
	append(L1,L3,L).

