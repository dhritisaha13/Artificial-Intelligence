transpose([],[],[]).
transpose([H1|T1],[H2|T2],[(H1,H2)|X]):-transpose(T1,T2,X).


