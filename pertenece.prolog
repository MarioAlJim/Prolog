%pertenece(X,[]).
%pertenece(X,[H|_]):- X==H.
pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).

main():- read(X), read(Y), pertenece(X, Y), write("true").
main():- write("false").

%ejecutar: pertenece(5,[])., pertenece(1,[2,1,4,5,9]).
