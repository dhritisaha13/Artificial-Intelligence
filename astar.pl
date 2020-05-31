len([], 0).
len([X|Y], LenResult):-
len(Y, L),
LenResult is L + 1.

reverse1([],[]).
reverse1([H|T],L):-
reverse1(T,Z),
append(Z,[H],L).

del([H|T],H,T).
del([H|T],Y,[H|Z]):-del(T,Y,Z).

consed( A, B, [B|A]).

%% move left in the top row
move([X1,0,X3, X4,X5,X6, X7,X8,X9],
     [0,X1,X3, X4,X5,X6, X7,X8,X9]).
move([X1,X2,0, X4,X5,X6, X7,X8,X9],
     [X1,0,X2, X4,X5,X6, X7,X8,X9]).

%% move left in the middle row
move([X1,X2,X3, X4,0,X6,X7,X8,X9],
     [X1,X2,X3, 0,X4,X6,X7,X8,X9]).
move([X1,X2,X3, X4,X5,0,X7,X8,X9],
     [X1,X2,X3, X4,0,X5,X7,X8,X9]).

%% move left in the bottom row
move([X1,X2,X3, X4,X5,X6, X7,0,X9],
     [X1,X2,X3, X4,X5,X6, 0,X7,X9]).
move([X1,X2,X3, X4,X5,X6, X7,X8,0],
     [X1,X2,X3, X4,X5,X6, X7,0,X8]).

%% move right in the top row 
move([0,X2,X3, X4,X5,X6, X7,X8,X9],
     [X2,0,X3, X4,X5,X6, X7,X8,X9]).
move([X1,0,X3, X4,X5,X6, X7,X8,X9],
     [X1,X3,0, X4,X5,X6, X7,X8,X9]).

%% move right in the middle row 
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
     [X1,X2,X3, X5,0,X6, X7,X8,X9]).
move([X1,X2,X3, X4,0,X6, X7,X8,X9],
     [X1,X2,X3, X4,X6,0, X7,X8,X9]).

%% move right in the bottom row
move([X1,X2,X3, X4,X5,X6,0,X8,X9],
     [X1,X2,X3, X4,X5,X6,X8,0,X9]).
move([X1,X2,X3, X4,X5,X6,X7,0,X9],
     [X1,X2,X3, X4,X5,X6,X7,X9,0]).

%% move up from the middle row
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
     [0,X2,X3, X1,X5,X6, X7,X8,X9]).
move([X1,X2,X3, X4,0,X6, X7,X8,X9],
     [X1,0,X3, X4,X2,X6, X7,X8,X9]).
move([X1,X2,X3, X4,X5,0, X7,X8,X9],
     [X1,X2,0, X4,X5,X3, X7,X8,X9]).

%% move up from the bottom row
move([X1,X2,X3, X4,X5,X6, X7,0,X9],
     [X1,X2,X3, X4,0,X6, X7,X5,X9]).
move([X1,X2,X3, X4,X5,X6, X7,X8,0],
     [X1,X2,X3, X4,X5,0, X7,X8,X6]).
move([X1,X2,X3, X4,X5,X6, 0,X8,X9],
     [X1,X2,X3, 0,X5,X6, X4,X8,X9]).

%% move down from the top row
move([0,X2,X3, X4,X5,X6, X7,X8,X9],
     [X4,X2,X3, 0,X5,X6, X7,X8,X9]).
move([X1,0,X3, X4,X5,X6, X7,X8,X9],
     [X1,X5,X3, X4,0,X6, X7,X8,X9]).
move([X1,X2,0, X4,X5,X6, X7,X8,X9],
     [X1,X2,X6, X4,X5,0, X7,X8,X9]).

%% move down from the middle row
move([X1,X2,X3, 0,X5,X6, X7,X8,X9],
     [X1,X2,X3, X7,X5,X6, 0,X8,X9]).
move([X1,X2,X3, X4,0,X6, X7,X8,X9],
     [X1,X2,X3, X4,X8,X6, X7,0,X9]).
move([X1,X2,X3, X4,X5,0, X7,X8,X9],
     [X1,X2,X3, X4,X5,X9, X7,X8,0]).

ind(H,[H|_],1):-!.
ind(H,[_|T],I):-ind(H,T,I1),I is I1+1.

row(I,R):-member([(1,1),(2,1),(3,1),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3)],(I,R)).

col(I,C):-member([(1,1),(2,2),(3,3),(4,1),(5,2),(6,3),(7,1),(8,2),(9,3)],(I,C)).

mhd(Goal,Node,H,D):-ind(H,Goal,I1),ind(H,Node,I2),row(I1,R1),row(I2,R2),col(I1,C1),col(I2,C2),D is abs(R1-R2)+abs(C1-C2).

h1([],[],0).
h1([H|Goal],[H|Node],N):-h1(Goal,Node,N),!.
h1([_|Goal],[_|Node],N):-h1(Goal,Node,N1),N is N1+1.

h2(_,[],_,0).
h2(Goal,[H|T],Node,N):-mhd(Goal,Node,H,D),h2(Goal,T,Node,D1),N is D+D1.

f1(Goal,[Node|Nodepath],F):-h1(Goal,Node,H),len(Nodepath,G),F is H+G.

f2(Goal,[Node|Nodepath],F):-h2(Goal,Goal,Node,H),len(Nodepath,G),F is H+G.

min_f1(_,[Nodepath],Nodepath):-!.
min_f1(Goal,[Nodepath|Nodepathlist],Nodepath):-f1(Goal,Nodepath,F),min_f1(Goal,Nodepathlist,Nodepath1),f1(Goal,Nodepath1,F1),F=<F1,!.
min_f1(Goal,[_|Nodepathlist],Nodepath):-min_f1(Goal,Nodepathlist,Nodepath).

min_f2(_,[Nodepath],Nodepath):-!.
min_f2(Goal,[Nodepath|Nodepathlist],Nodepath):-f2(Goal,Nodepath,F),min_f2(Goal,Nodepathlist,Nodepath1),f2(Goal,Nodepath1,F1),F=<F1,!.
min_f2(Goal,[_|Nodepathlist],Nodepath):-min_f2(Goal,Nodepathlist,Nodepath).

astar1(Goal, Checked, Path):-
    nb_getval(counter,Value),
    New_val is Value+1,
    nb_setval(counter,New_val),
    min_f1(Goal,Checked,[Goal|Visited]), 
    reverse1([Goal|Visited], Path).

astar1( Goal, Checked, Path) :-
    nb_getval(counter,Value),
    New_val is Value+1,
    nb_setval(counter,New_val),
    min_f1(Goal,Checked,Visited),
    del(Checked,Visited,Rest),
    Visited = [Start|_],            
    Start \== Goal,
    findall( X,
        ( move(Start,X), \+ member(Visited,X) ),
        [T|Extend]),
    maplist( consed(Visited), [T|Extend], VisitedExtended),
    append( Rest, VisitedExtended, UpdatedQueue),
    astar1( Goal, UpdatedQueue, Path ).

astar2(Goal, Checked, Path):-
    nb_getval(counter,Value),
    New_val is Value+1,
    nb_setval(counter,New_val),
    min_f2(Goal,Checked,[Goal|Visited]), 
    reverse1([Goal|Visited], Path).

astar2( Goal, Checked, Path) :-
    nb_getval(counter,Value),
    New_val is Value+1,
    nb_setval(counter,New_val),
    min_f2(Goal,Checked,Visited),
    del(Checked,Visited,Rest),
    Visited = [Start|_],            
    Start \== Goal,
    findall( X,
        ( move(Start,X), \+ member(Visited,X) ),
        [T|Extend]),
    maplist( consed(Visited), [T|Extend], VisitedExtended),
    append( Rest, VisitedExtended, UpdatedQueue),
    astar2( Goal, UpdatedQueue, Path ).

a_star1( Start, Goal):-nb_setval(counter,0),astar1( Goal, [[Start]], Path),len(Path,L),write(Path),nl,write("Length of path is "),write(L),nl,nb_getval(counter,Value),write("Total no. of nodes searched is "),write(Value),!.

a_star2( Start, Goal):-nb_setval(counter,0),astar2( Goal, [[Start]], Path),len(Path,L),write(Path),nl,write("Length of path is "),write(L),nl,nb_getval(counter,Value),write("Total no. of nodes searched is "),write(Value),!.
