% Solves the sudoku puzzle.
% Solves a sudoku puzzle described by a set of predicates
% pos(N,X,Y) where N is the number in location (X,Y) in the 
% Sudoku square.

sorts
#numbers = {1,2,3,4,5,6,7,8,9}.
#coordinates = coord(#numbers,#numbers).

predicates

in_region(#numbers,#numbers,#numbers).
num(#numbers).
coord(#numbers,#numbers).
pos(#numbers,#coordinates).

rules

% Possible positions for numbers 1-9 on a 9x9 grid:
pos(N,coord(X,Y)) | -pos(N,coord(X,Y)) :- num(N).

% No row can have the same number twice:
 :- pos(N,coord(X,Y2)), pos(N,coord(X,Y1)), num(N), Y1 != Y2.
                
% No column can have the same number twice:
 :- pos(N,coord(X2,Y)), pos(N,coord(X1,Y)), num(N), X1 != X2.
                
% No region can have the same number twice:
 :- pos(N,coord(X2,Y2)), pos(N,coord(X1,Y1)), num(N), 
	in_region(X1,Y1,R),	in_region(X2,Y2,R),
	X1 != X2, Y1 != Y2.
                  
% Every location must be filled in with a unique number
 :- pos(N1,coord(X,Y)), pos(N2,coord(X,Y)), N1 != N2.
				  
% A region is a 3x3 area within the Sudoku square
in_region(X,Y,((X-1)/3)*3+((Y+2)/3)).
                    
% Representation of a specific Sudoku puzzle. 
% pos(N,X,Y) is true when N is the number in the square and 
% (X,Y) are the coordinates in the Sudoku square.
pos(7,coord(2,1)).  pos(1,coord(4,1)).  pos(9,coord(1,2)).  pos(3,coord(6,2)). 
pos(7,coord(6,3)).  pos(2,coord(8,3)).  pos(5,coord(9,3)).  pos(6,coord(2,4)).
pos(5,coord(3,5)).  pos(6,coord(5,5)).  pos(2,coord(7,5)).  pos(9,coord(8,5)).
pos(3,coord(1,6)).  pos(4,coord(4,6)).  pos(5,coord(5,6)).  pos(6,coord(9,6)).
pos(1,coord(1,7)).  pos(2,coord(2,7)).  pos(8,coord(4,7)).  pos(8,coord(1,8)).
pos(9,coord(3,8)).  pos(4,coord(7,8)).  pos(7,coord(9,8)).  pos(5,coord(1,9)).