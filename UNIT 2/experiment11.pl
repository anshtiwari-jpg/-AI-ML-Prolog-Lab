% Experiment 11: Water Jug Problem Using State-Space Search
% Jug capacities: 4 litres and 3 litres.
% Goal: Measure exactly 2 litres in the 4-litre jug.
% State = state(AmountIn4LitreJug, AmountIn3LitreJug).

water_jug(Path) :-
    water_bfs([[state(0,0)]], Path).

water_bfs([[state(4,2)|Rest]|_], Path) :-
    reverse([state(4,2)|Rest], Path).

water_bfs([CurrentPath|Queue], Path) :-
    CurrentPath = [Current|_],
    findall([Next|CurrentPath],
            (jug_move(Current, Next),
             \+ member(Next, CurrentPath)),
            NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    UpdatedQueue \\= [],
    water_bfs(UpdatedQueue, Path).

jug_move(state(X,Y), state(4,Y)) :- X < 4.
jug_move(state(X,Y), state(X,3)) :- Y < 3.
jug_move(state(X,Y), state(0,Y)) :- X > 0.
jug_move(state(X,Y), state(X,0)) :- Y > 0.

% Pour water from the 4-litre jug into the 3-litre jug.
jug_move(state(X,Y), state(NewX,NewY)) :-
    X > 0, Y < 3,
    Transfer is min(X, 3-Y),
    Transfer > 0,
    NewX is X-Transfer,
    NewY is Y+Transfer.

% Pour water from the 3-litre jug into the 4-litre jug.
jug_move(state(X,Y), state(NewX,NewY)) :-
    Y > 0, X < 4,
    Transfer is min(Y, 4-X),
    Transfer > 0,
    NewX is X+Transfer,
    NewY is Y-Transfer.

% Sample query:
% ?- water_jug(Path).
