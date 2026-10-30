% Experiment 07: Breadth-First Search (BFS)
% BFS finds a shortest path in an unweighted graph.

edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, g).
edge(f, g).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

bfs_queue([Path|Queue], Goal, Result) :-
    Path = [Current|_],
    findall([Next|Path],
            (connected(Current, Next),
             \+ member(Next, Path)),
            NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Result).

% Sample query:
% ?- bfs(a, g, Path).
