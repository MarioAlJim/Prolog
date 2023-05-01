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

insertarFinal(X,[],X).
insertarFinal(X,[H|T],[H|R]):-insertarFinal(X,T,R).
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).
pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

sucesor(Estado,Sucesor,Ruta,Costo):-
    camino(Estado,Sucesor,Costo),
    not(pertenece(Sucesor,Ruta)).
sucesor(Estado,Sucesor,Ruta,Costo):-
    camino(Sucesor,Estado,Costo),
    not(pertenece(Sucesor,Ruta)).

%extenderRuta(Estado,Ruta,Sucesor,Solucion)
extenderRuta(_, _, [], []).
extenderRuta(Estado, Ruta, [_|Tsuc], [RutaAux | R]):-
    insertarFinal(Estado, Ruta, RutaAux),
    extenderRuta(Estado, Ruta, Tsuc, R).

extenderCosto(_,[],[]).
extenderCosto(Costo,[Hcsuc|Tcsuc],[CostoAux | R]):-
    CostoAux is Costo + Hcsuc,
    extenderCosto(Costo,Tcsuc,R).


bAmplitud(EstadoInicial,Meta,Sol):-
    bAmplitud([EstadoInicial],Meta,[[]],[0],Sol).
bAmplitud([Meta|_],Meta,[HR|_],[HC|_],[RutaAux,HC]):-
    insertarFinal(Meta,HR,RutaAux).
bAmplitud([Hcola|Tcola],Meta,[HR|TR],[HC|TC],Sol):-
    bagof(Sucesor,Costo^sucesor(Hcola,Sucesor,HR,Costo),BagSucesores),
    bagof(Costo,Sucesor^sucesor(Hcola,Sucesor,HR,Costo),BagCostos),
   concatenar(Tcola,BagSucesores,NuevaCola),
   extenderRuta(Hcola,HR,BagSucesores,NuevosSucesoresdeRutas),
  concatenar(TR,NuevosSucesoresdeRutas,NuevasRutas),
  extenderCosto(HC,BagCostos,CostosSucesores),
  concatenar(TC,CostosSucesores,NuevosCostos),
  bAmplitud(NuevaCola,Meta,NuevasRutas,NuevosCostos,Sol).

bAmplitud([_|Tcola],Meta,[_|Trutas],[_|Tcostos],Sol):-
    bAmplitud(Tcola,Meta,Trutas,Tcostos,Sol).
