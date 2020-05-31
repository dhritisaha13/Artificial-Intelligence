insertbst(X,nil,bst(nil,X,nil)).
insertbst(X,bst(Left,Root,Right),bst(Left1,Root,Right)):-
	X=<Root,!,insertbst(X,Left,Left1).
insertbst(X,bst(Left,Root,Right),bst(Left,Root,Right1)):-
	X>Root,insertbst(X,Right,Right1).

append([],L2,L2).
append([X|L1],L2,[X|L]):-append(L1,L2,L).

inorder(nil,[]).
inorder(bst(Left,Root,Right),L):-
	inorder(Left,L1),
	inorder(Right,L2),
	append(L1,[Root|L2],L).


sort_list([],[]).
sort_list(L,L1):-sr(L,nil,L2),inorder(L2,L1).


sr([],L,L).
sr([X|L],B,B1):-insertbst(X,B,B2),sr(L,B2,B1).

