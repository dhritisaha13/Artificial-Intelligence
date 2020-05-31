len([], 0).
len([X|Y], LenResult):-
len(Y, L),
LenResult is L + 1.

append([],L,L).
append([X|L1],L2,[X|L3]):-
append(L1,L2,L3).

trimlast(Old, N, New) :-
len(Tail, N),
append(New, Tail, Old).
