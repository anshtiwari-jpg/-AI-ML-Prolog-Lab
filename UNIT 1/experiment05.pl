% Experiment 05: Student Performance Classification
% Classification: topper (80 and above), average (40-79), fail (below 40).

student_marks(kavita, 85).
student_marks(rahul, 72).
student_marks(amit, 55).
student_marks(priya, 35).

performance(Marks, topper) :-
    Marks >= 80,
    Marks =< 100.

performance(Marks, average) :-
    Marks >= 40,
    Marks < 80.

performance(Marks, fail) :-
    Marks >= 0,
    Marks < 40.

student_performance(Name, Result) :-
    student_marks(Name, Marks),
    performance(Marks, Result).

% Sample query:
% ?- student_performance(kavita, Result).
