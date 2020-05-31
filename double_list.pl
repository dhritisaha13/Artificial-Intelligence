twice([], []).
twice([A|B], [A,A|Rest]) :- 
twice(B, Rest).
