%insertarInicio(X,L,R):- R=[X|L].
insertarInicio(X,L,[X|L]).
main():- read(X), read(L),insertarInicio(X, L, R),  write(R).