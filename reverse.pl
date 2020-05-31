reverse1([],[]).
reverse1([H|T],L):-
reverse1(T,Z),
append(Z,[H],L).
