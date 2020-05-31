deletenth([X|L],1,L).
deletenth([X|L],N,[X|L1]):-N1 is N-1 , deletenth(L,N1,L1).

len([], 0).
len([X|Y], LenResult):-
len(Y, L),
LenResult is L + 1.

delete_middle_even(L,L2):- len(L,Len),
N is div(Len,2),
deletenth(L,N ,L1),deletenth(L1,N,L2).


