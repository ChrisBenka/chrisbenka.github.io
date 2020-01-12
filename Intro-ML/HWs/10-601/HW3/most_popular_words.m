## Copyright (C) 2020 Chris Benka
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} most_popular_words (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chris Benka <chrisbenka@lpc-depaulsecure-219-177.depaulsecure-student.depaul.edu>
## Created: 2020-01-12

#calculate the n most popular words for each label y,
# D is the data likelihods
function [most_popular_words_economist_indices,most_popular_words_onion_indices] = most_popular_words (n, D)
  most_popular_words_economist = D(1,:)./D(2,:);
  most_popular_words_onion = D(2,:)./D(1,:);
  most_popular_words_economist_indices = zeros(n,1);
  most_popular_words_onion_indices = zeros(n,1);
  for i = 1:n
    [M,I] = max(most_popular_words_economist);
    [Mx,Id] = max(most_popular_words_onion);
    most_popular_words_economist_indices(i) = I;
    most_popular_words_onion_indices(i) = Id;
    most_popular_words_economist(I) = [];
    most_popular_words_onion(Id) = [];
  endfor
endfunction
