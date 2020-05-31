cutlast([_], []).
cutlast([X|Xs], [X|WithoutLast]) :- 
cutlast(Xs, WithoutLast).

