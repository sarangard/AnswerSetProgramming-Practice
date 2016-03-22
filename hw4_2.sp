sorts
#persons = {a,b,c,d,e}.
#spots = {1,2,3,4,5}.

predicates

spot(#spots).
person(#persons).
place(#persons,#spots).
neigbour(#persons,#persons).
married(#persons,#persons).
dislike(#persons,#persons).

rules

% Every person is assigned a spot
place(P,1) | place(P,2) | place(P,3) | place(P,4) | place(P,5):- person(P).

% Two people cannot occupy the same spot
-place(P2,S) :- place(P1,S), P1!=P2, spot(S), person(P1), person(P2).

% X and Y don't sit beside each other if they dislike each other.
:- dislike(P1,P2), place(P1,S1), place(P2,S2), S1-S2=1, P1 != P2, person(P1), person(P2).
:- dislike(P1,P2), place(P1,S1), place(P2,S2), S2-S1=1, P1 != P2, person(P1), person(P2).
:- dislike(P1,P2), place(P1,S1), place(P2,S2), S1-S2=4, P1 != P2, person(P1), person(P2).
:- dislike(P1,P2), place(P1,S1), place(P2,S2), S2-S1=4, P1 != P2, person(P1), person(P2).

% X and Y sit beside each other if they are married.
:- married(P1,P2), place(P1,S1), place(P2,S2), S1-S2>1, S1-S2<4, P1 != P2, person(P1), person(P2).
:- married(P1,P2), place(P1,S1), place(P2,S2), S2-S1>1, S2-S1<4, P1 != P2, person(P1), person(P2).

% CWA
%-married(X,Y) :- not married(X,Y).

person(a). person(b). person(c). person(d). person(e).
spot(1). spot(2). spot(3). spot(4). spot(5).

%Facts
married(a,b).
married(d,e).
dislike(a,c).
place(a,1).