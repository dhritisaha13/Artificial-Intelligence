append([],L,L).
append([X|L1],L2,[X|L3]):-
append(L1,L2,L3).

same_length([],[]).
same_length([X|Rest1],[Y|Rest2]):-
same_length(Rest1,Rest2).

efface(_,[],[]).
efface(A,[A|L],L):-!.
efface(A,[B|L],[B|M]):-
efface(A,L,M).

middle(L, M) :-
    same_length(L1, L2),
    append(L1, [M|L2], L).


del_middle([],[]).
del_middle(L,L1):-
    middle(L,M),
    efface(M,L,L1).

