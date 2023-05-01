concatenar([],L,L).
concatenar([H|T], L, [H|R]):- concatenar(T,L,R).

insertarFinal(E, [], [E]).
insertarFinal(E, [H|T], [H|R]):- insertarFinal(E,T,R).

concatenar2(L1,L2,R):- concatenar(L1,L2,[],R).
concatenar([],[],Ac,Ac).
concatenar([H|T],L2,Ac,R):- insertarFinal(H,Ac,Acx), concatenar(T,L2,Acx,R).
concatenar([],[H|T],Ac,R):- insertarFinal(H,Ac,Acx), concatenar([],T,Acx,R).

main():- read(X), read(L), concatenar(X, L, R), write(R).
