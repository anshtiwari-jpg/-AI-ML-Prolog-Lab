% Experiment 06: Route Recommendation System
% Routes are treated as two-way connections.

road(delhi, agra).
road(agra, jaipur).
road(delhi, chandigarh).
road(chandigarh, manali).
road(jaipur, udaipur).
road(agra, lucknow).

connected(X, Y) :-
    road(X, Y).
connected(X, Y) :-
    road(Y, X).

% Find a route without visiting a city more than once
route(Start, Goal, Path) :-
    route_path(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

route_path(Goal, Goal, Visited, Visited).

route_path(Current, Goal, Visited, Path) :-
    connected(Current, Next),
    \+ member(Next, Visited),
    route_path(Next, Goal, [Next|Visited], Path).

% Sample query:
% ?- route(delhi, manali, Path).
