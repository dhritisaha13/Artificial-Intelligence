fib(0,[0]).
fib(1,[1,0]).
fib(2,[1,1,0]).
fib(N,[R,X,Y|Rest]):-
N>2,
N1 is N-1,
fib(N1,[X,Y|Rest]),
R is (X+Y).
