% Program for Chapter 5 Exercise problem 2.
% John is married to Susan. Bob is married to Mary.
% Normally married people like each other.
% However Bob does not like Mary.
% Arnold and Kate are married. 
% Kate's behavior often does not follow predictable rules. [Additional Rules]

%Query for likes(X,Y) where X and Y are persons and X is married to Y.

sorts
#persons = {john,susan,bob,mary,arnold,kate}.
#default = d_likes(#persons,#persons).

predicates
likes(#persons,#persons).
d_likes(#persons,#persons).
ab(#default).
married(#persons,#persons).
hates(#persons,#persons).
person(#persons).

rules
%default - Married people normally like each other.
likes(X,Y) :- married(X,Y), not ab(d_likes(X,Y)), not -likes(X,Y).

%Strong Exception. If X hates Y then X does not like Y.
-likes(X,Y) :- hates(X,Y).

%If X is married to Y then Y is married to X.
married(Y,X) :- married(X,Y).

%If X is married to Y, then X and Y are persons.
person(X) :- married(X,Y).
person(Y) :- married(X,Y).

%CWA - If X may not hate Y then X does not hates Y. 
-hates(X,Y) :- not hates(X,Y).

%If X hates Y then Y does not hate X.
-hates(Y,X) :- hates(X,Y).

%Weak Exception - Unknown whether kate likes arnold.
ab(d_likes(kate,arnold)):- not -likes(kate,arnold).



%Facts
married(john,susan).
married(bob,mary).
hates(bob,mary).

%Additional Facts for 2(b)
married(arnold,kate).
