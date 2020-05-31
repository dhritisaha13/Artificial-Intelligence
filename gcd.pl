gcd(A,B,X):-A=0,X=B.
gcd(A,B,X):-B=0,X=A.
gcd(A,B,X):-A>=B,T is A-B,gcd(T,B,X).
gcd(A,B,X):-A<B,G is B-A,gcd(G,A,X).
