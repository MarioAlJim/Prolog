adyacente(1,2).
adyacente(2,3).
adyacente(3,4).
adyacente(3,5).
adyacente(4,6).
adyacente(5,6).
adyacente(5,7).
adyacente(6,8).
adyacente(7,8).
adyacente(8,9).
adyacente(9,10).
adyacente(9,13).
adyacente(10,11).
adyacente(11,12).
adyacente(11,14).
adyacente(12,15).
adyacente(13,16).
adyacente(14,15).
adyacente(15,18).
adyacente(16,17).
adyacente(16,19).
adyacente(17,20).
adyacente(18,22).
adyacente(19,20).
adyacente(20,21).
adyacente(21,22).

pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).
insertarFinal(E, [], [E]).
insertarFinal(E, [H|T], [H|R]):- insertarFinal(E,T,R).


sucesor(Estado,Ruta, Suc):- adyacente(Estado,Suc), not(pertenece(Suc,Ruta)), not(hoyo(Suc)).
sucesor(Estado,Ruta, Suc):- adyacente(Suc,Estado), not(pertenece(Suc,Ruta)), not(hoyo(Suc)).

%cambio de estado
busqueda(Sol):-busqueda(1,[],Sol).
%caso base
busqueda(Estado, Ruta, RutaSol):- tesoro(Estado),insertarFinal(Estado, Ruta, RutaSol).
%
busqueda(Estado, Ruta, Sol):-sucesor(Estado, Ruta, Suc), insertarFinal(Estado,Ruta,RutaNueva), busqueda(Suc,RutaNueva,Sol).


main():- read(X), read(Y), assert(tesoro(X)), assert(hoyo(Y)), busqueda(Sol), write(Sol).
main():- write("false").