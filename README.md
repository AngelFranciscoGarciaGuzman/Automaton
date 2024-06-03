# E1 Implementation of Lexical Analysis (Automaton and Regular Expression)
Angel Francisco Garcia Guzman A01704203

## Description
The language choosen to perform a lexical analisis for this evidence is the math language, 
especiffically the one in which you can have "all possible combinations of abc" but it
must follow a set of rules

1. It must *not have* "ccaa"
2. It must *not have* "bbb"
3. It *must contain* at least one sequence of "ab"

Considering the restricted set of characters in our language, leveraging a non-deterministic finite automaton (NFA) proves beneficial. 
Its utilization provides greater adaptability and interconnections within the scope of our problem.

## Design

Considering that our language is: 
Σ = a,b,c
we will implement the automaton using "q" states, the result implemented in a diagram looks like this:

![Automaton](https://github.com/AngelFranciscoGarciaGuzman/Automaton/blob/e1af6bc7b0168a4c09087088e8ba6a61c776ae58/Automaton%20.png)

This automaton translated into a Regular Expression (R.E) looks like this:
<strong>(a(bc) ∗ + c(bc) ∗ + b(bc)∗)</strong>

## Implementation
Before proceeding to translate our automaton into a Prolog file, we need to define the relations between the states. 
These relations will represent the transitions from one state to another based on the input symbols. 
We'll express these relations in a format that Prolog can understand, ensuring they are easily testable and modifiable.

<strong>transition(initial_state,letter,next_state)</strong>

So in the initial state of "q0" if we ingress the letter "a" we'll jump directly to the state "q8", in prolog it would look like this:

<strong>transition(q0,a,q8).</strong>

After coding all of the transitions of the automaton, we need to mark and define prolog wich states are accepted, for this we will create a function called final_state in which we establish that, if it is on that state, it will be true, otherwise it will be false.

```
final_state(q9).
final_state(q10).
final_state(q11).
final_state(q12).
final_state(q14).
final_state(q15).
```

Now we create a function called "automatonCheck" establishing the Base case: If the list is empty, check if the initial state is the final state.
If it matches any of the final states it will be true, otherwise it will be false.

```
automatonCheck([], InitialState) :-
    final_state(InitialState).
```

This function of "automatonCheck" recursively evaluates transitions in the automaton based on input symbols, ensuring adherence to the defined language rules.

```
automatonCheck([Symbol | RestofList], InitialState) :-
    transition(InitialState, Symbol, NextState),
    automatonCheck(RestofList, NextState).
```

We begin by transitioning to the next state according to the current symbol, then we verify if we have reached the end of the input string while also being in a final state; 
if not, we continue the process by recursively checking the automaton with the next state and symbol, repeating until we reach state "q7" as the final state.

And at the end we will use the function "recover_automaton" in order to write an input that it will be the combination of "abc" as a list and initiate the process on the initial "q0" state

```
recover_automaton(ListToBeChecked) :-
    automatonCheck(ListToBeChecked, q0).
```

The complexity of this system is O(n) because our process of traversing the input list involves iterating through each of the n letters in the list exactly once. 
This linear complexity arises because as the size of the input list increases, the time taken to process it increases proportionally. 

## Testing

You can download the file <strong>automaton.pl</strong> and try these inputs in the shell of prolog. 

All of these cases must be false:

False because it contains a sequence of 'bbb'
```
recover_automaton([a,b,b,b]).
```
False because it contains a sequence of 'ccaa'
```
recover_automaton([b,a,b,b,c,a,c,c,a,a]).
```
False because it contains a sequence of 'ccaa'
```
recover_automaton([c,a,b,c,c,a,a]).
```
False because it contains a sequence of 'bbb'
```
recover_automaton([a,a,b,c,b,b,a,b,b,b]).
```

All of these cases must be true:


True because it doesn't have any 'bbb' or 'ccaa' sequence and the 'ab' sequence is present
```
recover_automaton([c,c,a,c,b,a,b,b,c,a,b]).
```
```
recover_automaton([a,a,b,c,b,b,a,b,b]).
```
