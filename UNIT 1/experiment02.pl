% Experiment 02: Arithmetic Operations, Factorial and Fibonacci

% Arithmetic operations
add(A, B, R) :-
    R is A + B.

subtract_num(A, B, R) :-
    R is A - B.

multiply(A, B, R) :-
    R is A * B.

divide(A, B, R) :-
    B =\= 0,
    R is A / B.

% Factorial
factorial(0, 1).

factorial(N, F) :-
    integer(N),
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% Fibonacci number
fibonacci(0, 0).
fibonacci(1, 1).

fibonacci(N, F) :-
    integer(N),
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

% Sample queries:
% ?- add(10, 5, R).
% ?- factorial(5, F).
% ?- fibonacci(6, F).
