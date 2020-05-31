our_member(X,[X|_]).
our_member(X,[_|Rest]):-
our_member(X,Rest).
