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

sucesor(Estado,Sucesor,Ruta,Hoyo):- adyacente(Estado,Sucesor), (Sucesor \== Hoyo), not(pertenece(Sucesor,Ruta)).
sucesor(Estado,Sucesor,Ruta,Hoyo):- adyacente(Sucesor,Estado), (Sucesor \== Hoyo), not(pertenece(Sucesor,Ruta)).

%conversion
busqueda(Meta,Hoyo,Solucion):- busqueda(1,Meta,[1],Hoyo,Solucion).
%caso base
busqueda(Eini,Eini,Ruta,_,Ruta).
%caso recursivo
busqueda(Eactual,Meta,Ruta,Hoyo,Solucion):-sucesor(Eactual,Sucesor,Ruta,Hoyo),
    insertarFinal(Sucesor,Ruta,RutaNueva),busqueda(Sucesor,Meta,RutaNueva,Hoyo,Solucion).

main():- read(X), read(Y), busqueda(X,Y,Sol), write(Sol).
main():- write("false").


