%base de conocimientos
%solucion = [[arad,sibiu,fagaras], 450]
%
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



insertarFinal(X,[],[X]).
insertarFinal(X,[C|R],[C|L]):-insertarFinal(X,R,L).
pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

%Generar sucesores a partir de un estado valido
sucesor(Estado,Sucesor,Ruta,Costo):-
camino(Estado,Sucesor,Costo),not(pertenece(Sucesor,Ruta)).
sucesor(Estado,Sucesor,Ruta,Costo):-
camino(Sucesor,Estado,Costo),
not(pertenece(Sucesor,Ruta)).
%Extender ruta parametros:
%1 Estado actual
%2 la ruta de donde viene
%3 lista de sucesores del estado actual
%4 solucion
%extenderRuta(Sibiu,[arad],[oradea,fagaras,rimnicu],S).
%S=[[arad,sibiu],[arad,sibiu],[arad,sibiu]].

%si la lista de sucesores esta vacia (no hay sucesores) la solucion es una lista vacia
%caso base
extenderRuta(_,_,[],[]).
extenderRuta(EstadoActual,Ruta,[_|Tsucesores],[RutaAuxiliar | R]):-
insertarFinal(EstadoActual,Ruta,RutaAuxiliar),
extenderRuta(EstadoActual,Ruta,Tsucesores,R).


%si vienes de arad el costo al momento es 140
%extenderCostos(140,[151,99,80],S)
%S = [[291,239,200]].
%caso base si no hay sucesores el costo es cero
extenderCostos(_,[],[]).
extenderCostos(CostoActual,[HcostosSucesores|TCostosDeSucesores],[CostoAuxiliar|R]):-
CostoAuxiliar is CostoActual + HcostosSucesores,
extenderCostos(CostoActual,TCostosDeSucesores,R).
%�como generar la lista de sucesores?
%Recusrsividad a la cola
%Los parametros son:
%Cola
%Meta
%Rutas
%Costos
%Solucion
bAmplitud2(EstadoInicial,Meta,Solucion):-
    bAmplitud([EstadoInicial],Meta,[[]],[0],Solucion).
%Caso base
bAmplitud([Meta|_],Meta,[HRutas|_],[HCostos|_],[RutaAux,HCostos]):-
    insertarFinal(Meta,HRutas,RutaAux).


%caso recursivo
bAmplitud([HCola|TCola],Meta,[HRutas|TRutas],[HCostos|TCostos],Solucion):-
bagof(Sucesor,Costo^sucesor(HCola,Sucesor,HRutas,Costo),BagSucesores),
concatenar(TCola,BagSucesores,NuevaCola),
extenderRuta(HCola,HRutas,BagSucesores,NuevosSucesoresDeRutas),
concatenar(TRutas,NuevosSucesoresDeRutas,NuevasRutas),
bAmplitud(NuevaCola,Meta,NuevasRutas,NuevosCostos,Solucion).




%Caso recursivo cuando bagof da como resultado false.
bAmplitud([_|TCola],Meta,[_|TRutas],[_|TCostos],Solucion):-
    bAmplitud(TCola,Meta,TRutas,TCostos,Solucion).
