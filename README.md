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

This automaton translated into a Regular Expression (R.E) looks like this:
<strong>(a(bc) ∗ + c(bc) ∗ + b(bc)∗)</strong>
