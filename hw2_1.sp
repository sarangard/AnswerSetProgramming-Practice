% Program for Chapter 5 Exercise problem 1.
% Apollo and Helios are lions in a zoo. 
% Normally lions are dangerous.
% Baby Lions are not dangerous.
% Helios is a baby Lion.

%Query for dangerous(X) where X is a lion.
 
sorts
#lions = {helios, apollo, momos}.
#babies = {helios, momos}.
#default = d_dangerous(#lions).

predicates
dangerous(#lions).
lion(#lions).
d_dangerous(#lions).
baby(#babies).
ab(#default).

rules
%default - Normally lions are dangerous
dangerous(X) :- lion(X), not ab(d_dangerous(X)), not -dangerous(X).

%Strong exception - Baby Lions are not dangerous
-dangerous(X) :- lion(X), baby(X).

%If X is a baby then it is also a lion.
lion(X) :- baby(X).

%CWA - If X may not be a baby lion then it is not a baby lion.
-baby(X) :- lion(X), not baby(X).

%Facts
lion(apollo).
baby(helios).

%Additional Facts
-dangerous(apollo).
