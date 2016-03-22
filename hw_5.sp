%Blocks World Example%
#const n = 2.

sorts
#block = [b][0..7].
#location = #block + {t}.
#inertial_fluent = on(#block(X),#location(Y)):X!=Y.
#defined_fluent = above(#block(X),#location(Y)):X!=Y.
#fluent = #inertial_fluent + #defined_fluent.
#action = put(#block(X),#location(Y)):X!=Y.
#step = 0..n.

predicates
holds(#fluent,#step).
occurs(#action,#step).

rules
%holds(on(B,L),I): a block B is on location L at step I.
holds(on(b0,t),0).     
holds(on(b3,b0),0).
holds(on(b2,b3),0).
holds(on(b1,t),0).
holds(on(b4,b1),0).
holds(on(b5,t),0).
holds(on(b6,b5),0).
holds(on(b7,b6),0).  

%If block B is not known to be on location L at step 0,then we assume it is not.
-holds(on(B,L),0) :- not holds(on(B,L),0). 

%Putting block B on location L at step I causes B to be on L at step I+1:
holds(on(B,L),I+1) :- occurs(put(B,L),I).

%A block cannot be in two locations at once:
-holds(on(B,L2),I) :- holds(on(B,L1),I),    
                      L1 != L2. 
                      
%Only one block can be set directly on top of another:
-holds(on(B2,B),I) :- #block(B),
                      holds(on(B1,B),I),     
                      B1 != B2.
                   
% Inertia:   
holds(F,I+1) :- #inertial_fluent(F),
                holds(F,I),                  
                not -holds(F,I+1).

-holds(F,I+1) :- #inertial_fluent(F),
				 -holds(F,I),                
                 not holds(F,I+1).
                 
%It is impossible to move an occupied block:
-occurs(put(B,L),I) :- holds(on(B1,B),I).     

%It is impossible to move a block onto an occupied block:
-occurs(put(B1,B),I) :- #block(B),
                        holds(on(B2,B),I).     

%Specific actions for testing.
occurs(put(b2,t),0).
occurs(put(b7,b2),1).

% B is above L if it is directly on top of it or on top of another block that is above L.
holds(above(B,L),I) :- holds(on(B,L),I).
holds(above(B,L),I) :- holds(on(B,B1),I),
                       holds(above(B1,L),I).
%% CWA for above:
-holds(above(B,L),I) :- not holds(above(B,L),I). 
