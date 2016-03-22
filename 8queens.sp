sorts
#num = 1..8.
#cell = coord(#num,#num).

predicates
number(#num).
coord(#num,#num).
queen(#num).
at(#num,#cell).
placed(#num).

rules

%% generating solutions
at(Q,coord(X,Y)) | -at(Q,coord(X,Y)) :- queen(Q), coord(X,Y), number(X),number(Y).

% Queen is placed at most in one location.
:- at(Q,coord(R1,C1)), at(Q,coord(R2,C2)), R1 != R2.
:- at(Q,coord(R1,C1)), at(Q,coord(R2,C2)), C1 != C2.

% queen is placed in at least one location
placed(Q) :- at(Q,coord(R,C)).
:- not placed(Q).

% no two queens are placed in the same location
:- at(Q1,coord(R,C)), at(Q2,coord(R,C)), Q1 != Q2.

% no two queens are placed in the same row
:- at(Q1,coord(R,C1)), at(Q2,coord(R,C2)), C1 != C2.

% no two queens are placed in the same column
:- at(Q1,coord(R1,C)), at(Q2,coord(R2,C)), R1 != R2.

% no two queens are placed in the same diagonal
:- at(Q1,coord(R1,C1)), at(Q2,coord(R2,C2)), R1 != R2, C1 != C2,  R1-R2 == C1-C2.

% FACTS
number(1).number(2).number(3).number(4).number(5).number(6).number(7).number(8).
queen(1).queen(2).queen(3).queen(4).queen(5).queen(6).queen(7).queen(8).
coord(1,1).coord(2,1).coord(3,1).coord(4,1).coord(5,1).coord(6,1).coord(7,1).coord(8,1).
coord(1,2).coord(2,2).coord(3,2).coord(4,2).coord(5,2).coord(6,2).coord(7,2).coord(8,2).
coord(1,3).coord(2,3).coord(3,3).coord(4,3).coord(5,3).coord(6,3).coord(7,3).coord(8,3).
coord(1,4).coord(2,4).coord(3,4).coord(4,4).coord(5,4).coord(6,4).coord(7,4).coord(8,4).
coord(1,5).coord(2,5).coord(3,5).coord(4,5).coord(5,5).coord(6,5).coord(7,5).coord(8,5).
coord(1,6).coord(2,6).coord(3,6).coord(4,6).coord(5,6).coord(6,6).coord(7,6).coord(8,6).
coord(1,7).coord(2,7).coord(3,7).coord(4,7).coord(5,7).coord(6,7).coord(7,7).coord(8,7).
coord(1,8).coord(2,8).coord(3,8).coord(4,8).coord(5,8).coord(6,8).coord(7,8).coord(8,8).