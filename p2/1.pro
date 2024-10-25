%  se da o lista cu nr intregi, sa se scrie de 2 ori fiecaren r prim in lista
% Modelul Matematic recursiv
% Este_prim(N,k){
%   0, n <=1
%   0, n %k == 0 && k * k < n
%   1, k *k > n
%   Este_prim(n,k+1), altfel, k*k < nx
%}
% Dublare_prim(l1 l2 ... ln):
%   multimea_vida, n ==0
%   l1 + l1 + Dublare_prim(l2 ... ln), Este_prim(l1,k) se aplica si la n==1
%   l1 + Dublare_prim(l2 ... ln), altfel, ! este_prim(l1,k)

%este_prim(N:int, K:int)
% Model de flux (i, i)
% N nr de verificat
% K index curent de verificare
este_prim(N, K) :-
    N > 1,                       % Verificăm dacă N este mai mare decât 1
    ( K * K > N -> true ;        % Dacă K depășește sqrt(N), N este prim
      ( N mod K =:= 0 -> false ; % Dacă N este divizibil cu K, nu este prim
        K1 is K + 1,             % Incrementăm K
        este_prim(N, K1)          % Continuăm verificarea cu K+1
      )
    ).

% dublare_prim(L:list, Rez:lIST)
% Model de flux: (i,o)
% L: lista initiala
% Rez lista dupa dublarea nr prime
dublare_prim([],[]). % daca e gol returneaza lista []
dublare_prim([H1],Rez):- % Cazul in care mai este un singur element si este prim
    este_prim(H1,2),
    Rez = [H1,H1].
dublare_prim([H1],Rez):- % daca nu este prim
    \+ este_prim(H1,2),
    Rez = [H1].
dublare_prim([H1,H2|T],Rez):-% caz general daca este prim
    este_prim(H1,2),
    dublare_prim([H2|T],Rez1),
    Rez = [H1,H1|Rez1].
dublare_prim([H1,H2|T],Rez):-% caz general daca nu este prim
    \+ este_prim(H1,2),
    dublare_prim([H2|T],Rez1),
    Rez = [H1|Rez1].