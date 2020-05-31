remove_every_other([], []).
remove_every_other([X], [X]).
remove_every_other([X,_|Xs], [X|Ys]) :- remove_every_other(Xs, Ys).
