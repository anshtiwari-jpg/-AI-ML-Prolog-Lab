% Experiment 10: Blocks World
% State representation uses on(Block, Support) and ontable(Block).
% Example initial arrangement: A on B, B on table, C on table.

block(a).
block(b).
block(c).

initial_state([on(a,b), ontable(b), ontable(c)]).

% A block is clear if no other block is on it.
clear(Block, State) :-
    block(Block),
    \+ member(on(_, Block), State).

% A valid stacking move places a clear block on a clear block.
can_move(Block, Destination, State) :-
    block(Block),
    block(Destination),
    Block \\= Destination,
    clear(Block, State),
    clear(Destination, State),
    member(on(Block, _), State).

% Check whether a proposed state contains no block on itself.
valid_state(State) :-
    \+ member(on(X, X), State).

% Sample queries:
% ?- initial_state(State), clear(c, State).
% ?- initial_state(State), can_move(a, c, State).
% ?- valid_state([on(a,b), ontable(b), ontable(c)]).
