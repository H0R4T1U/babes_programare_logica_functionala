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
% MODEL MATEMATIC
% Vale(L):
% descendent(x1,x2,...xn){
%               true, []
%               descendent(x2,...xm),x1>= x2
%               ascendent(x2,....xn), altfel
%               }
% ascendent(x1,x2,...xn){
%   ascendent(x2,...xn), x1 < x2
%   fals, x1 > x2
%   true, []
%}