sorts
#typebird = {eagles, robins}.
#objects = {sr71blackbird, jo, eagle1}.

predicates
jet(#objects).
bird(#objects).
birdtype(#objects,#typebird).
faster(#objects, #objects).
robin(#objects).
eagle(#objects).


rules

% X is faster than Y if X is a Jet and Y is a Bird.
faster(X, Y) :- jet(X), bird(Y).

% X is faster than Y if X is an eagle and Y is a robin.
faster(X, Y) :- birdtype(X, eagles), birdtype(Y, robins).

% X is a bird if X is of any birdtype.
bird(X) :- birdtype(X, Y).

% X is of birdtype robins if X is a robin.
birdtype(X, robins) :- robin(X).

% X is of birdtype robins if X is a robin.
birdtype(X, eagles) :- eagle(X).

% Facts
jet(sr71blackbird).
robin(jo).
eagle(eagle1).

%CWA
-jet(X) :- bird(X).
-bird(X) :- jet(X).
-faster(Y,X) :- faster(X,Y).
-birdtype(X,Y) :- not birdtype(X, Y).