insertarFinal(E,[],[E]).
insertarFinal(E,[H|T],[H|R]):- insertarFinal(E,T,R).

pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).

movimientoJ1aJ2(J1,J2, J1N, J2N):- F is 5 - J2, F > 0, J2N is J2+F, J1N is J1-F.
movimientoJ1aJ2(J1,J2, J1N, J2N):- J1N is J1, J2N is J2.
movimientoJ1aJ3(J1,J3, J1N, J3N):- F is 3 - J3, F > 0, J3N is J3+F, J1N is J1-F.
movimientoJ1aJ3(J1,J3, J1N, J3N):- J1N is J1, J3N is J3.

%movimientoJ2aJ1(J2,J1, J2N, J1N).
%movimientoJ2aJ3(J2,J3, J2N, J3N).
%movimientoJ3aJ1(J3,J2, J3N, J1N).
%movimientoJ3aJ2(J3,J1, J3N, J2N).

generaSucesoresJ1(J1,J2,J3,L,C):- C==0, CN is C+1, J1>0, movimientoJ1aJ2(J1,J2,J1N, J2N),generaSucesoresJ1(J1N,J2N,J3,R,CN).
generaSucesoresJ1(J1,J2,J3,L,C):- C==1, CN is C+1, J1>0,movimientoJ1aJ3(J1,J3,J1N,J3N),insertarFinal([J1N,J2,J3N],L,R), generaSucesoresJ1(J1N,J2,J3N,R,CN).
generaSucesoresJ1(J1,J2,J3,L,_):- not(pertenece([J1,J2,J3],L)), insertarFinal([J1,J2,J3],L,R),write(R).

%generaSucesoresJ1(J1,J2,J3,L).
%generaSucesoresJ1(J1,J2,J3,L).

jarras(J1,J2,J3, L, R):- generaSucesores(J1,J2,J3,L,0).





inicio(R):-jarras(8,0,0, [], R).

movimientoJ1aJ2(J1,J2, J1N, J2N):- F is 5 - J2, F > 0, J2N is J2+F, J1N is J1-F.
movimientoJ1aJ2(J1,J2, J1N, J2N):- J1N is J1, J2N is J2.
movimientoJ1aJ3(J1,J3, J1N, J3N):- F is 3 - J3, F > 0, J3N is J3+F, J1N is J1-F.
movimientoJ1aJ3(J1,J3, J1N, J3N):- J1N is J1, J3N is J3.

movimientoJ2aJ1(J2,J1, J2N, J1N):- J1N = J1+J2, J2N is J2-J2.
movimientoJ2aJ3(J2,J3, J2N, J3N):- F is 3 - J3, F > 0, F > J2, J3N is J3+J2, J2N is J2-J2.
movimientoJ2aJ3(J2,J3, J2N, J3N):- F is 3 - J3, F > 0, J3N is J3+F, J2N is J2-F.
movimientoJ2aJ3(J2,J3, J2N, J3N):- J2N is J2, J3N is J3.

movimientoJ3aJ1(J3,J1, J3N, J1N):- J1N is J1+J3, J3N is J3-J3.
movimientoJ3aJ2(J3,J2, J3N, J2N):- F is 5 - J2, F > 0, F > J3, J2N is J2+J3, J3N is J3-J3.
movimientoJ3aJ2(J3,J2, J3N, J2N):- F is 5 - J2, F > 0, J2N is J2+F, J3N is J3-F.
movimientoJ3aJ2(J3,J2, J3N, J2N):- J3N is J3, J2N is J2.
