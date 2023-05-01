padre(juan, jesus).
padre(stan, juan).
padre(dios, stan).
padre(devil, lore).
madre(maria, jesus).
madre(lore, juan).
madre(espiritu, stan).
madre(luz, lore).

antepasado(X,Y):- padre(X,Y).
antepasado(X,Y):- padre(X,Z),antepasado(Z,Y).
antepasado(X,Y):- madre(X,Y).
antepasado(X,Y):- madre(X,U),antepasado(U,Y).



main():- read(X), read(Y), antepasado(X, Y), write("true").
main():- write("false").
