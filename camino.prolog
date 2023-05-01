camino(oradea, sibiu, 151).
camino(oradea, zerind, 71).
camino(zerind, arad, 75).
camino(arad, sibiu, 140).
camino(arad, timisoara, 118).
camino(sibiu, fagaras, 99).
camino(sibiu, rimnicu, 80).
camino(timisoara, lugoj, 111).
camino(lugoj, mechadia, 70).
camino(mechadia, dobreta, 75).
camino(dobreta, craiova, 120).
camino(rimnicu, craiova, 146).
camino(craiova, pitesti, 138).
camino(fagaras, bucarest, 211).
camino(pitesti, bucarest, 101).
camino(bucarest, giurgiu, 90).
camino(bucarest, urziceni, 85).
camino(urziceni, hirsova, 98).
camino(urziceni, vaslui, 142).
camino(hirsova, eforie, 86).
camino(vaslui, iasi, 92).
camino(iasi, neamt, 87).

pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).
insertarFinal(E, [], [E]).
insertarFinal(E, [H|T], [H|R]):- insertarFinal(E,T,R).


sucesor(Estado,Sucesor,Ruta,Costo):- camino(Estado,Sucesor,Costo), not(pertenece(Sucesor,Ruta)).
sucesor(Estado,Sucesor,Ruta,Costo):- camino(Sucesor,Estado,Costo), not(pertenece(Sucesor,Ruta)).

%recursividad a la cola con dos acumuladores
%El tercer parametro es el  acumulador de la ruta
%El segundo acumulador es del costo
bProfundidad(Eini,Meta,Solucion):- bProfundidad(Eini,Meta,[Eini],0,Solucion).
%caso base
bProfundidad(Eini,Eini,Ruta,Costo,[Ruta|Costo]).
%caso recursivo
bProfundidad(Eactual,Meta,Ruta,Costo,Solucion):-sucesor(Eactual,Sucesor,Ruta,CostoSucesor),insertarFinal(Sucesor,Ruta,RutaNueva),CostoNuevo is Costo + CostoSucesor,bProfundidad(Sucesor,Meta,RutaNueva,CostoNuevo,Solucion).
