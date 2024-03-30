%List of transitions
transition(q0,a,q8).
transition(q0,c,q1).
transition(q0,b,q5).

transition(q1,a,q8).
transition(q1,c,q2).
transition(q1,b,q5).

transition(q2,a,q3).
transition(q2,b,q5).
transition(q2,c,q1).

transition(q3,c,q1).
transition(q3,b,q9).
transition(q3,a,q4).

transition(q5,a,q8).
transition(q5,b,q6).
transition(q5,c,q1).

transition(q6,a,q8).
transition(q6,b,q4).
transition(q6,c,q7).

transition(q8,a,q8).
transition(q8,b,q9).
transition(q8,c,q1).

transition(q9,a,q9).
transition(q9,b,q15).
transition(q9,c,q10).

transition(q10,a,q9).
transition(q10,b,q14).
transition(q10,c,q11).

transition(q11,a,q12).
transition(q11,b,q14).
transition(q11,c,q10).

transition(q12,a,q13).
transition(q12,b,q14).
transition(q12,c,q10).

transition(q14,a,q9).
transition(q14,b,q15).
transition(q14,c,q10).

transition(q15,a,q9).
transition(q15,b,q16).
transition(q15,c,q10).

%List for all of the final positive states of the automaton
final_state(q9).
final_state(q10).
final_state(q11).
final_state(q12).
final_state(q14).
final_state(q15).


% Predicate to recover automaton, starting with initial state q0
recover_automaton(ListToBeChecked) :-
    automatonCheck(ListToBeChecked, q0).

% Base case: If the list is empty, check if the initial state is a final state
automatonCheck([], InitialState) :-
    final_state(InitialState).

% Recursive case: Transition from one state to another based on the symbols in the list
automatonCheck([Symbol | RestofList], InitialState) :-
    transition(InitialState, Symbol, NextState),
    automatonCheck(RestofList, NextState).



