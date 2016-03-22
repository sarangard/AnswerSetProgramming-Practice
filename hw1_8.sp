% Asuming that the graph does not have any self loops.
sorts
#vertices = {a,b,c,d,e,f,g,h}.

predicates

vertex(#vertices).
path(#vertices, #vertices).
connected(#vertices, #vertices).
blocked(#vertices, #vertices).

rules
% There is no path from X to Y, if the path from X to Y is blocked.
-path(X,Y) :- blocked(X,Y).

% Vertices X and Y are connected if there is a path from X to Y (OR) if there is a path from X to Z and vertices Z and Y are connected.
connected(X,Y) :- path(X,Y), X!=Y.
connected(X,Y) :- path(X,Z), connected(Z,Y).

%CWA
-path(X,Y) :- not path(X,Y).
-connected(X,Y) :- not connected(X,Y).

%FACTS
path(a,b).
path(a,c).
path(c,e).
path(b,e).
blocked(b,d).
path(b,h).
path(f,h).
path(d,f).
path(d,g).
blocked(e,g).
path(h,a).
