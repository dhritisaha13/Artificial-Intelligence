next_higher_permutation2(L,L1):-reverse(L,L2),nhp(L2,[],L1).

nhp([H|T],[],L1):-nhp(T,[H],L1),!.
nhp([H|T],[H1|T1],L1):-
	H>H1,!,
	nhp(T,[H,H1|T1],L1).
nhp([H|T],A,L1):-
	reverse(A,L2),
	greater(L2,H,X),
	replace(L2,X,H,L3),
	reverse([X|T],L4),
	append(L4,L3,L1).

greater([H|_],X,H):-H>X,!.
greater([_|T],X,Y):-greater(T,X,Y).

replace([], _, _, []).
replace([A|T],A,B, [B|T2]) :- replace(T,A,B, T2),!.
replace([H|T],A,B, [H|T2]) :- H =\= A, replace(T,A,B, T2).
