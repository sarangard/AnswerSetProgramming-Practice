% Problem 8
% 
% A person can graduate if he/she has taken both math and graphs.
% Review_Records is true for him/her if the information is incomplete. 
%
% Assumption is that the information is complete for review_records i.e. 
% If the information on the courses he/she took is incomplete then, review_records is true.
% Else it is false.  

sorts
#courses = {math,graphs}.
#students = {john,mary,bob,rick}.
#default = d_grad(#students).

predicates
student(#students).
course(#courses).
took(#students,#courses).
can_graduate(#students).
review_records(#students).
ab(#default).

rules

%Students who took both math and grpah courses can graduate.
can_graduate(X) :- took(X,math), took(X,graphs).

%Normally students graduate only if they take both math and graph courses.
-can_graduate(X) :- not ab(d_grad(X)), not can_graduate(X).
ab(d_grad(X)) :- not -took(X,math), not -took(X,graphs).

%If there is no reason to believe that the student can graduate or no reason to believe he cannot graduate then review records of that student.
review_records(X) :- not can_graduate(X), not -can_graduate(X).

%CWA - If there may be no reason to beleive that review records is true then review records is false.
-review_records(X) :- not review_records(X).
 
%facts
student(john).
student(mary).
student(bob).
student(rick).
course(math).
course(graphs).
took(john,math).
took(john,graphs).
-took(mary,math).
-took(mary,graphs).
-took(bob,math).