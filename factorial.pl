factorial(0, 1).
factorial(X, R) :-
X > 0, X1 is X-1, factorial(X1, S), R is S*X.
