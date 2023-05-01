insertarFinal(E, [], [E]).
insertarFinal(E, [H|T], [H|R]):- insertarFinal(E,T,R).

main():- read(X), read(L), insertarFinal(X,L,R), write(R).
