:-dynamic casilla/2.

generaPosicionesX(X,X,_).
generaPosicionesX(N,X,Y):-assert(casilla(X,Y)), XN is X + 1, generaPosicionesX(N,XN,Y).

generaTablero(Y,_,Y).
generaTablero(N,X,Y):- generaPosicionesX(N,X,Y), YN is Y + 1, generaTablero(N,X,YN).

principal(N):- generaTablero(N,0,0),!.

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

sucesor(X, Y, _, []):-
casilla(X, Y).



sucesor(X, Y, _, [H|T]):-
casilla(X, Y),
not(pertenece(X, [H|T])),
XMasUno is H + 1,
%%XMasUno =< Limite,
not(XMasUno == X),
XMenosUno is H - 1,
%%XMenosUno >= 0,
not(XMenosUno == X).



concatenar([],L,L).
concatenar([X|T],L,[X|C]):-concatenar(T,L,C).



/*insertarFinal(X,[],[X]).
insertarFinal(X,[H|T],[H|L]):-insertarFinal(X,T,L).*/




nReinas(N, Solucion):-principal(N), nReinas(0, N, [], [], Solucion).




nReinas(Limite, Limite, _, Lista, Lista).




nReinas(Y, Limite, Acumulador, Lista, Solucion):-
sucesor(X, Y, Limite, Acumulador),
concatenar(Lista, [[X,Y]], NuevaLista),
Ordenada is Y + 1,
nReinas(Ordenada, Limite, [X|Acumulador], NuevaLista, Solucion).








