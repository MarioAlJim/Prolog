/* Paso 1:
 * Delimitar base de conocimientos dinámicamente.
*/
:-dynamic casilla/2.

/* Paso 1.1:
 * Generar valores de abcisas para cada ordenada.
*/
generaPosicionesX(X,X,_).
generaPosicionesX(N,X,Y):-assert(casilla(X,Y)), XN is X + 1, generaPosicionesX(N,XN,Y).

/* Paso 1.2:
 * Generar valores de ordenadas.
*/
generaTablero(N,_,N).
generaTablero(N,X,Y):- generaPosicionesX(N,X,Y), YN is Y + 1, generaTablero(N,X,YN).

/* Paso 1.3:
 * Generar tablero.
*/
principal(N):-retractall(casilla(_,_)), N > 0, generaTablero(N,0,0),!.

/* Función pertenece. */
pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

/* Paso 2:
 * Establecer sucesores.
*/
sucesor(X, Y,[]):-
casilla(X, Y).

sucesor(X, Y, [H|T]):-
casilla(X, Y),
not(pertenece(Y, [H|T])),
XMasUno is H + 1,
not(XMasUno == Y),
XMenosUno is H - 1,
not(XMenosUno == Y).

/* Función diagonal.
 * Permite determinar si dos pares ordenados pertenecen
 * a una misma recta, ya que no pueden posicionarse reinas en diagonal.
*/
diagonal(_, _, []):-!.
diagonal(X, Y, [[H,T]|R]):-
VariableAuxiliarAbcisa is X - H,
abs(VariableAuxiliarAbcisa, Abcisa),
VariableAuxiliarOrdenada is Y - T,
abs(VariableAuxiliarOrdenada, Ordenada),
not(Abcisa ==  Ordenada),
diagonal(X, Y, R).

/* Función concatenar. */
concatenar([],L,L).
concatenar([X|T],L,[X|C]):-concatenar(T,L,C).


/* Paso 3:
 * Búsqueda en profunidad.
 * Aplicación de recursividad a la cola.
*/
nReinas(N, Solucion):-principal(N), nReinas(0, N, [], [], Solucion).

/* Paso 3.1:
 * Recursividad (caso base).
*/
nReinas(Limite, Limite, _, Lista, Lista).


/* Paso 3.2:
 * Recursividad (caso recursivo).
*/
nReinas(X, Limite, Acumulador, Lista, Solucion):-
/* Paso 3.2.1:
 * Generar un sucesor por rama.
*/
sucesor(X, Y, Acumulador),
/* Paso 3.2.2:
 * Verificar que el sucesor no coincide en diagonal con un par ordenado
 * de Lista.
*/
diagonal(X, Y, Lista),
/* Paso 3.2.3:
 * Actualizar el acumulador de ruta.
*/
concatenar(Lista, [[X,Y]], NuevaLista),
/* Paso 3.2.4:
 * Actualizar el valor del valor de X.
*/
Abcisa is X + 1,
/* Paso 3.2.5:
 * Llamar recursivamente con el nuevo acumulador de ordenadas,
 * el nuevo de valor de X, y la nueva lista de pares ordenados.
*/
nReinas(Abcisa, Limite, [Y|Acumulador], NuevaLista, Solucion).
