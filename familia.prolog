papa(jose,joseph).
papa(jose,hiroshi).
papa(humberto,mario).
papa(alberto,ana).
mama(eli,joseph).
mama(eli,hiroshi).
mama(martha,mario).
mama(martha,ana).

hermano(X,Y):-papa(Z,X),papa(Z,Y),not(X==Y).

medioHermano(X,Y):-mama(A,X),mama(A,Y),papa(Z,X),papa(U,Y),not(Z==U).

