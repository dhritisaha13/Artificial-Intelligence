circular_right_shift([],[]).
circular_right_shift(L, R) :-
   circular_left_shift(R, L).

circular_left_shift([],[]).
circular_left_shift([H|T], R) :- append(T, [H], R).
