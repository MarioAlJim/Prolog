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



sucesor(Estado,Sucesor,Ruta,Evitar):- adyacente(Estado,Sucesor), (Sucesor \== Evitar), not(pertenece(Sucesor,Ruta)).
sucesor(Estado,Sucesor,Ruta,Evitar):- adyacente(Sucesor,Estado), (Sucesor \== Evitar), not(pertenece(Sucesor,Ruta)).

%conversion
busqueda(Espada,Dragon,Solucion):- busquedaEspada(1,Espada,[1],Dragon,Solucion).
%caso encontrar espada e ir por dragon
busquedaEspada(Eactual,Eactual,Ruta1,Dragon,Solucion):-busquedaDragon(Eactual,Dragon,Eactual,Ruta1,[],Solucion).
%caso recursivo buscar espada
busquedaEspada(Eactual,Espada,Ruta,Dragon,Solucion):- sucesor(Eactual,Sucesor,Ruta,Dragon),
    insertarFinal(Sucesor,Ruta,RutaNueva),busquedaEspada(Sucesor,Espada,RutaNueva,Dragon,Solucion).

%caso base encontrar dragon y concatenar camino uno y dos
busquedaDragon(Eactual,Eactual,_,Ruta1,Ruta2,Solucion):-concatenar(Ruta1,Ruta2,Solucion).
%caso recursivo buscar dragon
busquedaDragon(Eactual,Dragon,Espada,Ruta1,Ruta2,Solucion):- sucesor(Eactual,Sucesor,Ruta2,Espada),insertarFinal(Sucesor,Ruta2,RutaNueva),busquedaDragon(Sucesor,Dragon,Espada,Ruta1,RutaNueva,Solucion).

main():- read(X), read(Y), busqueda(X,Y,R), write(R).
main():- write("false").


