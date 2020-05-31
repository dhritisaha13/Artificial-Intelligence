len([],0).
len([X|L],N):-len(L,N1),N is N1+1.

find(X,[X|L2],[],L2).
find(X,[Y|L],[Y|L1],L2):-find(X,L,L1,L2).

append([],L,L).
append([X|L1],L2,[X|L]):-append(L1,L2,L).

partpre(PL,0,[],PL).
partpre([X|PL],N,[X|PL1],PL2):-N1 is N-1,partpre(PL,N1,PL1,PL2).

rev([],L,L).
rev([X|L],L1,L2):-rev(L,[X|L1],L2).

postin(PL,IL,B):-rev(PL,[],RPL),prein(RPL,IL,B).

prein([X],[X],[X]).
prein([],[],[]).
prein([X|PL],IL,B):-find(X,IL,L,R),
		len(R,N1),
		partpre(PL,N1,PRL2,PRL1),
		prein(PRL2,R,PL2),
		prein(PRL1,L,PL1),
		append([X|PL1],PL2,B).
