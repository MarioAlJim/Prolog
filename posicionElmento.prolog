%elemento = X, lista = Y, Z
posicionElemento(X,Y,Z):- posicionElemento(X,Y,1,[],Z).
posicionElemento(_,[],_,Z,Z).
posicionElemento(X,[X|T],P,Z,R):-insertarFinal(P,Z,L), PS is P + 1, posicionElemento(X,T,PS,L,R).
posicionElemento(X,[_|T],P,L,Z):- PS is P + 1, posicionElemento(X,T,PS,L,Z).


insertarFinal(P,[],[P]).
insertarFinal(P,[H|T],[H|R]):- insertarFinal(P,T,R).


main():- read(X), read(Y), posicionElemento(X, Y, Z), write(Z).



4, [12,3,4,5,6,7,4,7,8,4],R

[4, 8, 11]
