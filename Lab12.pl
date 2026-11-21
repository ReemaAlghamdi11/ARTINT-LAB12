
% Facts for the cities
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Taif', 'Dammam').
edge('Taif', 'Tabuk').
edge('Tabuk', 'Taif').
edge('Riyadh', 'Dammam').
edge('Dammam', 'Qatif').
edge('Dammam', 'Riyadh').
edge('Qatif', 'Madinah').
edge('Qatif', 'Dammam').

% Find a path between two cities
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

% Stop when we reach the destination
path(X, X, P, P).

% Find the next city without visiting the same city again
path(X, Y, Visited, P) :-
    edge(X, Z),
    not(member(Z, Visited)),
    path(Z, Y, [Z|Visited], P).
