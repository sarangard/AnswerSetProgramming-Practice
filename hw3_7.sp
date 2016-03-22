% Problem 7
% 
% A person can graduate only if he/she has taken both math and graphs.

sorts
#courses = {math,graphs}.
#students = {john,mary}.

predicates
took(#students,#courses).
student(#students).
course(#courses).
can_graduate(#students).

rules
%Students can graduate only if they have taken both math and graphs.
can_graduate(X) :- took(X,math), took(X,graphs).

%CWA
-can_graduate(X) :- not can_graduate(X).

%facts
student(john).
student(mary).
course(math).
course(graphs).
took(john,math).
took(john,graphs).
took(mary,graphs).
