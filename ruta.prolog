ruta_directa(xalapa,coatepec).
ruta_directa(coatepec, allende).
ruta_directa(allende, xico).
ruta_directa(banderilla, xalapa).
ruta_directa(perote, vigas).
ruta_directa(vigas, cruz_blanca).
ruta_directa(puebla,perote).

%ruta(X,Y):-ruta_directa(X,U),ruta_directa(U,Y).
%ruta(X,Y):-ruta_directa(X,U),ruta_directa(U,Z),ruta_directa(Z,Y).
%ruta(X,Y):-ruta_directa(X,U),ruta_directa(U,Z),ruta_directa(Z,V),ruta_directa(V,Y).
%ruta(X,Y):-ruta_directa(Y,U),ruta_directa(U,Z),ruta_directa(Z,V),ruta_directa(V,X).
%ruta(X,Y):-ruta_directa(Y,U),ruta_directa(U,Z),ruta_directa(Z,X).
%ruta(X,Y):-ruta_directa(Y,U),ruta_directa(U,X).

ruta(X,Y):- ruta_directa(X,Y).
ruta(X,Y):- ruta_directa(Y,X).
ruta(X,Y):- ruta_directa(X,Z), ruta(Z,Y).
ruta(X,Y):- ruta_directa(Y,Z), ruta(Z,X).

main():- read(X), read(Y), ruta(X, Y), write("true").
main():- write("false").