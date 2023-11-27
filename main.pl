% Provided Facts
male(i).
spouse(i,widow).
spouse(widow,i).
female(widow).

child(redhair,widow).
female(redhair).

child(i,dad).
male(dad).

spouse(dad,redhair).
spouse(redhair,dad).

child(onrun,dad).
male(onrun).

child(baby,i).
male(baby).

% Kinship Rules
father(X, Y) :- male(X), child(Y, X).
mother(X, Y) :- female(X), child(Y, X).
son(X, Y) :- male(X), child(X, Y).
daughter(X, Y) :- female(X), child(X, Y).
brother(X, Y) :- male(X), child(X, Z), child(Y, Z), X \= Y.
sister(X, Y) :- female(X), child(X, Z), child(Y, Z), X \= Y.
grandfather(X, Y) :- male(X), parent(X, Z), parent(Z, Y).
grandmother(X, Y) :- female(X), parent(X, Z), parent(Z, Y).
grandchild(X, Y) :- child(X, Z), parent(Z, Y).
uncle(X, Y) :- male(X), brother(X, Z), parent(Z, Y).
aunt(X, Y) :- female(X), sister(X, Z), parent(Z, Y).
nephew(X, Y) :- male(X), child(X, Z), sibling(Y, Z).
niece(X, Y) :- female(X), child(X, Z), sibling(Y, Z).
parent(X, Y) :- father(X, Y); mother(X, Y).
child(X, Y) :- son(X, Y); daughter(X, Y).
sibling(X, Y) :- brother(X, Y); sister(X, Y).
son_in_law(X, Y) :- male(X), spouse(X, Z), child(Z, Y).
daughter_in_law(X, Y) :- female(X), spouse(X, Z), child(Z, Y).

% Run Program:
runit :- daughter(redhair,i), mother(redhair,i), son_in_law(dad,i), brother(baby, dad), uncle(baby,i), brother(baby,redhair), grandchild(onrun,i), mother(widow,redhair), grandmother(widow,i), grandchild(i,widow), grandfather(i,i).
