next_higher_permutation(L,L1) :-
higher_permutation(L,L1),
not(far_higher_permutation(L1,L)).

higher_permutation(L,L1) :-
permutation(L,L1),
higher(L1,L).

higher([H1|T1],[H|T]) :- H1 > H ,!.

higher([H|T1],[H|T]) :- higher(T1,T).

far_higher_permutation(L1,L) :-
higher_permutation(L,L2),
higher(L1,L2).

permutation([],[]).
permutation(L,[H|T]) :-
select1(H,L,R),
permutation(R,T).

select1(X,[X|R],R).
select1(X,[H|R],[H|R1]) :-
select1(X,R,R1).
