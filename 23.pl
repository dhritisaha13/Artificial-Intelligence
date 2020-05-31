append([],L,L).
append([X|L1],L2,[X|L3]):-
append(L1,L2,L3).

circular_left_shift([],[]).
circular_left_shift([H|T], R) :- append(T, [H], R).
