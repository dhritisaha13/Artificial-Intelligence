insertbst(X,nil,bst(nil,X,nil)).
insertbst(X,bst(Left,Root,Right),bst(Left1,Root,Right)):-
	X=<Root,!,insertbst(X,Left,Left1).
insertbst(X,bst(Left,Root,Right),bst(Left,Root,Right1)):-
	X>Root,insertbst(X,Right,Right1).

deletenode(X,bst(nil,X,nil),nil).
deletenode(X,bst(Left,Root,Right),bst(Left1,Root,Right)):-
	X<Root,!,deletenode(X,Left,Left1).
deletenode(X,bst(Left,Root,Right),bst(Left,Root,Right1)):-
	X>Root,!,deletenode(X,Right,Right1).

deletenode(X,bst(nil,X,Right),Right).
deletenode(X,bst(Left,X,nil),Left).
deletenode(X,bst(Left,X,Right),bst(Left,L,Right1)):-min(Right,L),deletenode(L,Right,Right1).

deletemin(bst(nil,X,nil),X,nil).
deletemin(bst(Left,Root,Right),M,L):-min(bst(Left,Root,Right),M),deletenode(M,bst(Left,Root,Right),L).

min(bst(nil,X,_),X).
min(bst(Left,X,Right),M):-min(Left,M).

sort_list([],[]).
sort_list(L,L1):-sr(L,nil,L2),bsttolist(L2,L1).

bsttolist(nil,[]).
bsttolist(B,[M|L]):-deletemin(B,M,B1),bsttolist(B1,L).

sr([],L,L).
sr([X|L],B,B1):-insertbst(X,B,B2),sr(L,B2,B1).

