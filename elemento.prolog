elementoMayor(L,R):- elementoMayor(L,1,R).
elementoMayor([],E,E).
elementoMayor([H|T],E,R):- E<H, elementoMayor(T,H,R).
elementoMayor([H|T],E,R):- E>H, elementoMayor(T,E,R).
elementoMayor([H|T],E,R):- E==H, elementoMayor(T,E,R).


main():-read(L),elementoMayor(L,  R),write(R).
