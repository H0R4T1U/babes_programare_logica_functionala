vale(L) :-
    % Predicat din prolog care concateneaza liste
    % cazul meu: D=> Lista descrescatoare este concatenata cu lista [M|U] creand lista initiala,
    % [M|U] este lista crescatoara cu M cel mai mic element din descending
    append(D, [M|U], L),
    descending(D),
    ascending([M|U]).

descending([]).
descending([_]).
descending([X,Y|T]) :-
    X >= Y,
    descending([Y|T]).

ascending([]). 
ascending([_]).
ascending([X,Y|T]) :-
    X < Y,
    ascending([Y|T]).
