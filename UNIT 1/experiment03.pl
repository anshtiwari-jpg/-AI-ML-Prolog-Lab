% Experiment 03: Prolog List Operations

% Check whether an element is present in a list
list_member(X, [X|_]).

list_member(X, [_|T]) :-
    list_member(X, T).

% Append two lists
list_append([], L, L).

list_append([H|T], L, [H|R]) :-
    list_append(T, L, R).

% Find the length of a list
list_length([], 0).

list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.

% Reverse a list
list_reverse(L, R) :-
    reverse_list(L, [], R).

reverse_list([], Acc, Acc).

reverse_list([H|T], Acc, R) :-
    reverse_list(T, [H|Acc], R).

% Sample queries:
% ?- list_member(3, [1,2,3,4]).
% ?- list_append([1,2], [3,4], R).
% ?- list_length([a,b,c], N).
% ?- list_reverse([1,2,3], R).
