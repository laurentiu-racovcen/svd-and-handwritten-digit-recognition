## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} KNN (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-08-09

function prediction = KNN (labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;

  % initializeaza distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);

  % TODO: pentru fiecare rand calculati distanta Euclidiana dintre acesta si
  % vectorul de test primit ca argument.
  for i=1:m
    % initializare diferenta vectorilor
    dif = zeros(1,size(Y,1));
    squared_dif = zeros(1,size(Y,1));
    suma = 0;
    % se calculeaza diferenta dintre Y(i,:) si test
    dif = Y(i,:) - test;
    % diferentele se ridica la patrat
    squared_dif = dif.^2;
    % se calculeaza suma patratelor diferentelor
    suma = sum(squared_dif);
    % se calculeaza radical din suma patratelor
    distance(i) = sqrt(suma);
  endfor

  % TODO: ordonati crescator distantele si tineti minte intr-un vector primele
  % k valori care reprezinta valorile adevarate ale acestor imagini care s-au
  % dovedit a fi cele mai apropiate.
  % Hint [~,aux] = sort (...)
  [distance,aux] = sort(distance);

  % in k_values se stocheaza primele k elemente din vectorul "labels" care
  % corespund cu primii 5 indecsi din vectorul distance
  k_values = zeros(1,k);
  for i=1:k
    k_values(i) = labels(aux(i));
  endfor

  % TODO: calculati predictia ca mediana celor k valori cele mai apropiate.
  prediction = median(k_values);
endfunction
