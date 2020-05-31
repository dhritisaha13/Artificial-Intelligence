find_nos(N,N,[N]).
find_nos(N,M,[N|L]):-
N1 is N+1,
N<M,
find_nos(N1,M,L).

