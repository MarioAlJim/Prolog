invertir([],[]).
invertir([H|T],R):-invertir(T,W),insertarFinalito(W,H,R).
%invertir([X,Y],Z):- insertarFinalito(Z,X,R),invertir(Y,R).
%concatenar([],X,X).
%concatenar(Y,X,[_|T]):-concatenar([],X,T).

insertarFinalito([],X,[X]).
insertarFinalito([H|T],X,[H|R]):-insertarFinalito(T,X,R).

%concatenar([],L,L).
%concatenar([H|T], L, [H|R]):- concatenar(T,L,R).

main():-  read(L),  invertir(L, R), write(R).
