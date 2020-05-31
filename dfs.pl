len([], 0).
len([X|Y], LenResult):-
len(Y, L),
LenResult is L + 1.

reverse1([],[]).
reverse1([H|T],L):-
reverse1(T,Z),
append(Z,[H],L).

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

dfs(S,Path,Path,S):-nb_getval(counter,Value),
                    New_val is Value+1,
                    nb_setval(counter,New_val),!.

dfs(S,Checked,Path,Goal) :-
    nb_getval(counter,Value),
    New_val is Value+1,
    nb_setval(counter,New_val),
    len(Checked,L),L=<8,
    move(S, S2),
    \+member(Checked,S2),
    dfs(S2,[S2|Checked],Path,Goal).

depth_first(Start,Goal):-nb_setval(counter,0),dfs(Start,[Start],Path_rev,Goal),reverse1(Path_rev,Path),len(Path,L),write(Path),nl,write("Length of path is "),write(L),nl,nb_getval(counter,Value),write("Total no. of nodes searched is "),write(Value),!. 
