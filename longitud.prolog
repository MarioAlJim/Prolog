long([],0).
long([_|Xs],L):-long(Xs,L1),L is L1+1.
