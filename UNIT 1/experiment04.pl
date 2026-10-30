% Experiment 04: College Timetable Knowledge Base
% timetable(Subject, Faculty, Day, Time, Room).

timetable(ai_ml, rahul, monday, '09:00-10:00', room101).
timetable(mathematics, amit, monday, '10:00-11:00', room102).
timetable(programming, priya, tuesday, '09:00-10:00', lab1).
timetable(database, rahul, tuesday, '10:00-11:00', room101).
timetable(networking, amit, wednesday, '11:00-12:00', room103).
timetable(ai_ml, priya, thursday, '09:00-10:00', room102).
timetable(programming, rahul, friday, '10:00-11:00', lab1).

% Find classes on a particular day
class_on(Day, Subject, Faculty, Time, Room) :-
    timetable(Subject, Faculty, Day, Time, Room).

% Find the schedule of a faculty member
faculty_schedule(Faculty, Day, Subject, Time, Room) :-
    timetable(Subject, Faculty, Day, Time, Room).

% Find classes scheduled in a particular room
room_schedule(Room, Day, Subject, Faculty, Time) :-
    timetable(Subject, Faculty, Day, Time, Room).

% Sample queries:
% ?- class_on(monday, Subject, Faculty, Time, Room).
% ?- faculty_schedule(rahul, Day, Subject, Time, Room).
% ?- room_schedule(lab1, Day, Subject, Faculty, Time).
