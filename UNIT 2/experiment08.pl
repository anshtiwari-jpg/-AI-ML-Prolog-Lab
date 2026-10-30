% Experiment 08: Depth-First Search (DFS)

edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, g).
edge(f, g).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

dfs(Start, Goal, Path) :-
    dfs_path(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

dfs_path(Goal, Goal, Visited, Visited).

dfs_path(Current, Goal, Visited, Path) :-
    connected(Current, Next),
    \+ member(Next, Visited),
    dfs_path(Next, Goal, [Next|Visited], Path).

% Sample query:
% ?- dfs(a, g, Path).
