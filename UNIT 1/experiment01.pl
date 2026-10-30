

% Experiment 01: Student-Course Knowledge Base

% Students
student(kiran).
student(rahul).
student(amit).
student(priya).

% Courses
course(ai_ml).
course(data_science).
course(computer_science).

% Enrolments
enrolled(kiran, ai_ml).
enrolled(rahul, data_science).
enrolled(amit, computer_science).
enrolled(priya, ai_ml).

% Check whether a student is enrolled in AI and ML
ai_ml_student(X) :-
    student(X),
    enrolled(X, ai_ml).

% Find the course of a student
student_course(X, Y) :-
    student(X),
    enrolled(X, Y).

% Sample queries:
% ?- ai_ml_student(X).
% ?- student_course(rahul, Course).
