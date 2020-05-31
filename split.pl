split1([], [], []).
split1([Head|Tail], [Head|List1], List2) :- 
Head>=0, split1(Tail, List1, List2).
split1([Head|Tail], List1, [Head|List2]) :-
Head<0, split1(Tail, List1, List2).
