len([], 0).
len([X|Y], LenResult):-
len(Y, L),
LenResult is L + 1.

append([],L,L).
append([X|L1],L2,[X|L3]):-
append(L1,L2,L3).

trim(L,N,S) :-    
  len(P,N) ,   
  append(P,S,L) . 
