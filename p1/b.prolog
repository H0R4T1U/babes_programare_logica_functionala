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

% Suma_alternata_h(x1 x2...xn,suma,index){
% suma_alternata_h(x2....xn,suma+x1,index+1), index % 2 ==1
% suma_alternata_h(x2...xn,suma-x1,index+1), index % 2 == 0
%}
% Suma_alternata(x1 x2 ... xn){
%   Suma_alternata_h(x1 x2 ... xn, 0, 1)
%}