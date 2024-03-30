?- recover_automaton([b,b,a,c,c,a,b]).
true .

?- recover_automaton([a,b,b,b]).
false.

?- recover_automaton([b,a,b,b,c,a,c,c,a,a]).
false.

?- recover_automaton([a,b,a,c,c,a,b,b,a,b,c,c,a,c,b,a]).
true .

?- recover_automaton([c,a,b,c,c,a,a]).
false.

?- recover_automaton([a,a,b,c,b,b,a,b,b,b]).
false.

