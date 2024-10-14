% suma_alternanta(+List, -Sum)
% Calculează suma alternantă a elementelor din List și o returnează în Sum.

suma_alternanta([], 0).  % Cazul de bază: lista este goală, suma este 0.

suma_alternanta([H|T], Sum) :-
    % Determinăm lungimea listei și indexul elementului curent.
    length([H|T], N),
    % Calculăm suma alternantă.
    sum_alternanta_helper(T, H, 1, N, Sum).

% sum_alternanta_helper(+List, +CurrentSum, +Index, +Length, -FinalSum)
% Funcție auxiliară pentru a calcula suma alternantă.

sum_alternanta_helper([], CurrentSum, _, _, CurrentSum).  % Cazul de bază: lista este goală.

sum_alternanta_helper([H|T], CurrentSum, Index, Length, FinalSum) :-
    % Adaugă sau scade elementul în funcție de index.
    (   Index mod 2 =:= 0  % Index par
    ->  NewSum is CurrentSum + H
    ;   NewSum is CurrentSum - H  % Index impar
    ),
    % Apel recursiv pentru restul listei, incrementând indexul.
    NewIndex is Index + 1,
    sum_alternanta_helper(T, NewSum, NewIndex, Length, FinalSum).

