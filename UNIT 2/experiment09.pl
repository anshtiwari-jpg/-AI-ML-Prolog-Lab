% Experiment 09: Hill Climbing Algorithm
% Lower heuristic values indicate states closer to the goal.

hill_edge(a, b).
hill_edge(a, c).
hill_edge(b, d).
hill_edge(b, e).
hill_edge(c, f).
hill_edge(e, g).
hill_edge(f, g).

heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 2).
heuristic(d, 6).
heuristic(e, 1).
heuristic(f, 1).
heuristic(g, 0).

hill_connected(X, Y) :- hill_edge(X, Y).
hill_connected(X, Y) :- hill_edge(Y, X).

hill_climbing(Start, Goal, Path) :-
    heuristic(Start, H),
    climb(Start, Goal, [Start], H, RevPath),
    reverse(RevPath, Path).

climb(Goal, Goal, Path, _, Path).

climb(Current, Goal, Visited, CurrentH, Path) :-
    findall(H-Next,
            (hill_connected(Current, Next),
             \+ member(Next, Visited),
             heuristic(Next, H),
             H < CurrentH),
            Neighbors),
    Neighbors \\= [],
    sort(Neighbors, [NextH-Next|_]),
    climb(Next, Goal, [Next|Visited], NextH, Path).

% Sample query:
% ?- hill_climbing(a, g, Path).
