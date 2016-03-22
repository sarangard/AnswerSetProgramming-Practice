%% s_sudoku.sp -- SPARC version of Sudoku from Chapter 6, Section 6.2
%% Last Modified: 2/21/14
%% Solves the sudoku puzzle.
%% Solves a sudoku puzzle described by a set of predicates
%% pos(N,X,Y) where N is the number in location (X,Y) in the 
%% Sudoku square.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sorts

#num = 1..9.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
predicates

%% pos(N,X,Y) is true when N is the number in location (X,Y) in 
%% the Sudoku square.
pos(#num,#num,#num).

%% in_region(X,Y,R) is true when coordinate (X,Y) is in 
%% region R of the Sudoku square.
in_region(#num,#num,#num).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rules

%% Possible positions for numbers 1-9 on a 9x9 grid:
pos(1,X,Y) | pos(2,X,Y) | pos(3,X,Y) | pos(4,X,Y) | pos(5,X,Y) |
pos(6,X,Y) | pos(7,X,Y) | pos(8,X,Y) | pos(9,X,Y).

%% No row can have the same number twice:
-pos(N,X,Y2) :- pos(N,X,Y1), 
                Y1 != Y2.
                
%% No column can have the same number twice:
-pos(N,X2,Y) :- pos(N,X1,Y), 
                X1 != X2.
                
%% No region can have the same number twice:
-pos(N,X2,Y2) :- pos(N,X1,Y1),  
                 in_region(X1,Y1,R),
                 in_region(X2,Y2,R),
                 X1 != X2,
                 Y1 != Y2.
                    
%% A region is a 3x3 area within the Sudoku square:
in_region(X,Y,((X-1)/3)*3+((Y+2)/3)).
		   
%% Representation of a specific Sudoku puzzle. 
%% pos(N,X,Y) is true when N is the number in the square and 
%% (X,Y) are the coordinates in the Sudoku square.
pos(7,2,1).  pos(1,4,1).  pos(9,1,2).  pos(3,6,2). 
pos(7,6,3).  pos(2,8,3).  pos(5,9,3).  pos(6,2,4).
pos(5,3,5).  pos(6,5,5).  pos(2,7,5).  pos(9,8,5).
pos(3,1,6).  pos(4,4,6).  pos(5,5,6).  pos(6,9,6).
pos(1,1,7).  pos(2,2,7).  pos(8,4,7).  pos(8,1,8).
pos(9,3,8).  pos(4,7,8).  pos(7,9,8).  pos(5,1,9).