sorts
#s = {a,b,c}.

predicates
p(#s).
q(#s).

rules
p(a) :- not q(a).
q(a) :- not p(a).