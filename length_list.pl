len([], 0).
len([X|Y], LenResult):-
len(Y, L),
LenResult is L + 1.
