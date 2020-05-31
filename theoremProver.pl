our_member([X|_],X).
our_member([_|Rest],X):-
our_member(Rest,X).

del([H|T],H,T).
del([H|T],Y,[H|Z]):-del(T,Y,Z).

union([],L,L).
union([H|L1],L2,L3):-our_member(L2,H),!,union(L1,L2,L3).
union([H|L1],L2,[H|L3]):-union(L1,L2,L3).

subset([],_).
subset([H|T],L):-our_member(L,H),!,subset(T,L).

pl_resolve([],Cj,Cj):-!.
pl_resolve([H|Ci],Cj,Cl):-our_member(Cj,H),!,pl_resolve(Ci,Cj,Cl).
pl_resolve([H|Ci],Cj,Cl):-our_member(Cj,not(H)),!,del(Cj,not(H),Ck),pl_resolve(Ci,Ck,Cl).
pl_resolve([not(H)|Ci],Cj,Cl):-our_member(Cj,H),!,del(Cj,H,Ck),pl_resolve(Ci,Ck,Cl).
pl_resolve([H|Ci],Cj,[H|Cl]):-pl_resolve(Ci,Cj,Cl),!.

is_null([],true):-!.
is_null(_,false):-!.

result(Clauses,true):-our_member(Clauses,[]),!.
result(_,false).

resolvent(_,[],[]):-!.
resolvent(H,[C1|Clauses],New):-pl_resolve(H,C1,New1),resolvent(H,Clauses,New2),union([New1],New2,New),!.

resolve([],false,[]):-!.
resolve([H|Clauses],Result,New):-resolvent(H,Clauses,New1),resolve(Clauses,_,New2),union(New1,New2,New),result(New,Result),!.

resolution(Clauses,true):-resolve(Clauses,true,New),!,write(New),nl.
resolution(Clauses,false):-resolve(Clauses,false,New),subset(New,Clauses),!,write(New),nl.
resolution(Clauses,Result):-resolve(Clauses,false,New),union(Clauses,New,New_Clauses),write(New_Clauses),nl,resolution(New_Clauses,Result),!.

