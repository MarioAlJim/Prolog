elementoMayor(L,R):-elementoMayor(L,0,R).

elementoMayor([],E,E):-E.
elementoMayor([H|T],E,R):- H<E, elementoMayor(T,E,R).
elementoMayor([H|T],E,R):- H>=E, elementoMayor(T,H,R).


main():-
read(L),
elementoMayor(L,  R),
write(R).



[12,2,3,5,9,14], R

14