insertar(X,Y,R):-insertar(X,Y,[],R).
insertar(_,[],R,R).
insertar(X,[],L,R):- insertarFinal(X,L,Z),insertar(_,[],Z,R).
insertar(X,[H|T],L,R):- H>X, insertarFinal(X,L,Z), concatenar([H],Z,V), concatenar(V,T,LF),insertar(_,[],LF,R).
insertar(X,[H|T],L,R):- H=<X, insertarFinal(H,L,Z), insertar(X,T,Z,R).

insertarFinal(P,[],[P]).
insertarFinal(P,[H|T],[H|R]):- insertarFinal(P,T,R).
concatenar([],L,L).
concatenar([H|T], L, [H|R]):- concatenar(T,L,R).


main():-read(X), read(Y), insertar(X,Y,R), write(R).



8, [1,2,3,4,5,6,7,9,10]
[1,2,3,4,5,6,7,8,9,10]