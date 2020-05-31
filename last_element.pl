last_element([X],X).
last_element([Y|Rest],X):-
last_element(Rest,X).
