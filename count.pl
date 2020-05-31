count_elems([], _, Count, Count). 
count_elems([H|T], N, Acc, Count) :-
H > N,                            
Acc1 is Acc + 1,                  
count_elems(T, N, Acc1, Count).   
count_elems([H|T], N, Acc, Count) :-
H =< N,                           
count_elems(T, N, Acc, Count).    
    
