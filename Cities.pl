
% Facts - Directed Graph

edge('Makkah', 'Madinah').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Madinah', 'Riyadh').
edge('Madinah', 'Al-Qatif').
edge('Al-Qatif', 'Madinah').
edge('Al-Qatif', 'Dammam').
edge('Dammam', 'Al-Qatif').
edge('Taif', 'Dammam').
edge('Makkah', 'Riyadh').
edge('Riyadh', 'Dammam').
edge('Dammam', 'Riyadh').


% Finding paths between cities

path(X, Y, Path) :-
    travel(X, Y, [X], ReversePath),
    reverse(ReversePath, Path).


% Direct path

travel(X, Y, Visited, [Y|Visited]) :-
    edge(X, Y),
    \+ member(Y, Visited).


% Indirect path

travel(X, Y, Visited, Path) :-
    edge(X, Z),
    \+ member(Z, Visited),
    travel(Z, Y, [Z|Visited], Path).
