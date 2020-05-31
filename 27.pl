unfold([],[]).
unfold(L,L1):-
	append(X,[M|Y],L),
	same_length(X,Y),
	reverse1(X,L2),
	reverse1(Y,L3),
	append(L2,[M|L3],L1).

same_length([],[]).
same_length([X|Rest1],[Y|Rest2]):-
same_length(Rest1,Rest2).

reverse1([],[]).
reverse1([H|T],L):-
reverse1(T,Z),
append(Z,[H],L).
