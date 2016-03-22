sorts
#objects = {flyingobjects,bird,jet,robin,eagle,sr_71,jo}.

predicates
class(#objects).
is_subclass(#objects , #objects).
subclass(#objects , #objects).
is_a(#objects , #objects).
member(#objects , #objects).
siblings(#objects , #objects).
is_faster(#objects , #objects).
faster(#objects , #objects).

rules
class(flyingobjects).
class(bird).
class(jet).
is_subclass(bird , flyingobjects).
is_subclass(jet , flyingobjects).
is_a(eagle , bird).
is_a(robin , bird).
is_a(sr_71,jet).
is_a(jo , robin).
is_faster(jet , bird).
is_faster(sr_71 , eagle).
is_faster(sr_71 ,robin).
is_faster(sr_71,jo).
is_faster(eagle , jo).

subclass(X,Y) :- is_subclass(X,Y).
subclass(X,Z) :- is_subclass(X,Y),subclass(Y,Z).
-subclass(X,Z) :- not subclass(X,Z),class(X),class(Z).

member(X,Y) :- is_a(X,Y).
member(X,Z) :- is_a(X,Y),subclass(Y,Z).
-member(X,Z) :- not member(X,Z).

faster(X,Z) :- is_faster(X,Y),is_faster(Y,Z).


-faster(X,Z) :- not faster(X,Z).
