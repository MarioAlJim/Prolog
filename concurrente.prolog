eliminar(_,[],[]).
eliminar(X,[X|L],R):-eliminar(X,L,R).
eliminar(X,[Y|L],[Y|R]):-eliminar(X,L,R).

main():-  read(X), read(L),  eliminar(X, L, R),   write(R).