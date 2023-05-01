digito(1,uno).
digito(2,dos).
digito(3,tres).
digito(4,cuatro).
digito(5,cinco).
digito(6,seis).
digito(7,siete).
digito(8,ocho).
digito(9,nueve).
digito(0,cero).

letra(X,Y):-digito(X,Y).

digitos(X,Y):-digitos(X,[],Y).
digitos([], Y, Y).
digitos([N|Ns], Y, R):- digito(N,X),agregarFinal(Y,X,Z),digitos(Ns,Z,R).


agregarFinal([],E,[E]).
agregarFinal([H|T], E, [H|R]):-agregarFinal(T,E,R).


main():- read(X), digitos(X, L), write(L).
