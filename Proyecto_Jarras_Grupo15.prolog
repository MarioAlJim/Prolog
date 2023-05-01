/* Paso 1:
 * Delimitar base de conocimientos dinámicamente.
*/

/* De jarra de 8 L a jarra de 5 L. */
combinacion([X,Y,Z], [0,B,Z]):-
VariableAuxiliar is 5 - Y,
X =< VariableAuxiliar,
B is X + Y,
B =< 5,
not(B == Y).

/* De jarra de 8 L a jarra de 3 L. */
combinacion([X,Y,Z], [0,Y,C]):-
VariableAuxiliar is 3 - Z,
X =< VariableAuxiliar,
C is X + Z,
C =< 3,
not(C == Z).

/* De jarra de 8 L a jarra de 5 L, con excedente. */
combinacion([X,Y,Z], [A,5,Z]):-
VariableAuxiliar is 5 - Y,
X > VariableAuxiliar,
A is X - VariableAuxiliar,
A =< 8,
not(A == X).

/* De jarra de 8 L a jarra de 3 L, con excedente. */
combinacion([X,Y,Z], [A,Y,3]):-
VariableAuxiliar is 3 - Z,
X > VariableAuxiliar,
A is X - VariableAuxiliar,
A =< 8,
not(A == X).

/* De jarra de 5 L a jarra de 8 L. */
combinacion([X,Y,Z], [A,0,Z]):-
VariableAuxiliar is 8 - X,
Y =< VariableAuxiliar,
A is X + Y,
A =< 8,
not(A == X).

/* De jarra de 5 L a jarra de 8 L, con excedente. */
combinacion([X,Y,Z], [8,B,Z]):-
VariableAuxiliar is 8 - X,
Y > VariableAuxiliar,
B is Y - VariableAuxiliar,
B =< 5,
not(B == Y).

/* De jarra de 5 L a jarra de 3 L. */
combinacion([X,Y,Z], [X,0,C]):-
VariableAuxiliar is 3 - Z,
Y =< VariableAuxiliar,
C is X + Z,
C =< 3,
not(C == Z).

/* De jarra de 5 L a jarra de 3 L, con excedente. */
combinacion([X,Y,Z], [X,B,3]):-
VariableAuxiliar is 3 - Z,
Y > VariableAuxiliar,
B is Y - VariableAuxiliar,
B =< 5,
not(B == Y).

/* De jarra de 3 L a jarra de 8 L. */
combinacion([X,Y,Z], [A,Y,0]):-
VariableAuxiliar is 8 - X,
Z =< VariableAuxiliar,
A is X + Z,
A =< 8,
not(A == X).

/* De jarra de 3 L a jarra de 8 L, con excedente. */
combinacion([X,Y,Z], [8,Y,C]):-
VariableAuxiliar is 8 - X,
Z > VariableAuxiliar,
C is Z - VariableAuxiliar,
C =< 3,
not(C == Z).

/* De jarra de 3 L a jarra de 5 L. */
combinacion([X,Y,Z], [X,B,0]):-
VariableAuxiliar is 5 - Y,
Z =< VariableAuxiliar,
B is Y + Z,
B =< 5,
not(B == Y).

/* De jarra de 3 L a jarra de 5 L, con excedente. */
combinacion([X,Y,Z], [X,5,C]):-
VariableAuxiliar is 5 - Y,
Z > VariableAuxiliar,
C is Z - VariableAuxiliar,
C =< 3,
not(C == Z).

/* Función pertenece. */
pertenece(X,[X|_]):-!.
pertenece(X,[_|T]):-pertenece(X,T).

/* Paso 2:
 * Establecer sucesores.
*/
sucesor([X,Y,Z], Sucesor, Lista):-
combinacion([X,Y,Z], Sucesor),
not(pertenece(Sucesor, Lista)).

/* Función concatenar. */
concatenar([],L,L).
concatenar([X|T],L,[X|C]):-concatenar(T,L,C).

/* Paso 3:
 * Extender ruta (generar ramas por cada sucesor).
 *
 * Paso 3.1:
 * Recursividad (caso base).
*/
extenderRuta(_, _, [], []):-!.

/* Paso 3.2:
 * Recursividad (caso recursivo).
*/
extenderRuta(Estado, Movimientos, [_|Sucesores], [ListaAuxiliar|Solucion]):-
concatenar(Movimientos, Estado, ListaAuxiliar),
extenderRuta(Estado, Movimientos, Sucesores, Solucion).


/* Paso 4:
 * Búsqueda en amplitud.
 * Aplicación de recursividad a la cola.
*/
jarra(Solucion):-
jarra([[8,0,0]], [4,_,_], [[]], Solucion),!.


/* Paso 4.1:
 * Recursividad (caso base).
*/
jarra([Meta|_], Meta, [CabezaCombinaciones|_], ListaAuxiliar):-
concatenar(CabezaCombinaciones, [Meta], ListaAuxiliar).


/* Paso 4.2:
 * Recursividad (primer caso general).
*/
jarra([CabezaTuplas|RestoTuplas], Meta, [CabezaCombinaciones|RestoCombinaciones], Solucion):-
/* Paso 4.2.1
 * Generar lista de sucesores con bagof.
*/
bagof(Sucesor, sucesor(CabezaTuplas, Sucesor, CabezaCombinaciones), BagCombinaciones),
/* Paso 4.2.2
 * Encolar los sucesores del frente de la cola
 * y desencolar el frente de la cola.
 *
 * Se genera una nueva cola sin el frente,
 * servirá para la próxima recursividad.
*/
concatenar(RestoTuplas, BagCombinaciones, NuevoRestoTuplas),
/* Paso 4.2.3
 * Extender rutas, una por cada sucesor.
*/
extenderRuta([CabezaTuplas], CabezaCombinaciones, BagCombinaciones, ListaNuevasCombinaciones),
/* Paso 4.2.4
 * NuevasListas sirve para la próxima recursividad.
*/
concatenar(RestoCombinaciones, ListaNuevasCombinaciones, NuevaLista),
/* Paso 4.2.5:
 * Llamar recursivamente con la nueva cola y con la nueva lista
 * de tuplas.
*/
jarra(NuevoRestoTuplas, Meta, NuevaLista, Solucion).


/* Paso 4.3:
 * Recursividad (segundo caso general).
*/
jarra([_|RestoTuplas], Meta, [_|RestoCombinaciones], Solucion):-
jarra(RestoTuplas, Meta, RestoCombinaciones, Solucion).


/* Función main que permite mostrar las unificaciones a Solucion
 * completas.
*/
main():- jarra(Solucion), write(Solucion).
