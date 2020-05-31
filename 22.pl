append([],L,L).
append([X|L1],L2,[X|L3]):-
append(L1,L2,L3).

exchange_first_last([X], [X]).
exchange_first_last([], []).
exchange_first_last(A, B) :-
append([First | Mid], [Last], A),
append([Last | Mid], [First], B).
