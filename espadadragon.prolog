adyacente(1,2).
adyacente(2,3).
adyacente(3,5).
adyacente(3,4).
adyacente(5,6).
adyacente(4,6).
adyacente(6,7).
adyacente(6,8).
adyacente(7,9).
adyacente(8,9).
adyacente(9,10).
adyacente(10,11).

pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).
insertarFinal(E, [], [E]).
insertarFinal(E, [H|T], [H|R]):- insertarFinal(E,T,R).
concatenar([],L,L).
concatenar([H|T], L, [H|R]):- concatenar(T,L,R).
sucesor(Estado, Suc):- adyacente(Estado, Suc).
sucesor(Estado, Suc):- adyacente(Suc, Estado).

%caso base
bEspada(Estado, Ruta, Ruta):-espada(Estado).
%caso recursivo
bEspada(Estado,Ruta,Sol):-sucesor(Estado,Suc), not(dragon(Suc)), not(pertenece(Suc,Ruta)), insertarFinal(Estado,Ruta,RutaN), bEspada(Suc,RutaN,Sol).


bDragon(Estado, Ruta1, Ruta2):- dragon(Estado),insertarFinal(Estado, Ruta1, Ruta2).

bDragon(Estado,Ruta,Sol):- sucesor(Estado,Suc), not(pertenece(Suc,Ruta)),insertarFinal(Estado,Ruta,RutaNueva), bDragon(Suc,RutaNueva,Sol).

busqueda(R):- bEspada(1,[],RutaEspada),espada(Espada),bDragon(Espada,[],RutaDragon),concatenar(RutaEspada,RutaDragon,R).

main():- read(X), read(Y), assert(espada(X)), assert(dragon(Y)),
busqueda(R), write(R).
main():- write("false").
