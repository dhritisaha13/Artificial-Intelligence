max(X,Y,X):-X>=Y,!.
max(X,Y,Y).

height(nil,0).
height(bt(Left,Root,Right),X):-
	height(Left,X1),
	height(Right,X2),
	max(X1,X2,X3),
	X is X3+1.
