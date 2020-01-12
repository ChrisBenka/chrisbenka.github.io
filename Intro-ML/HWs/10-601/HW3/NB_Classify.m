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
## @deftypefn {} {@var{retval} =} NB_Classify (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chris Benka <chrisbenka@lpc-depaulsecure-219-177.depaulsecure-student.depaul.edu>
## Created: 2020-01-12

#the NB Optimal classifier is dedined as: argmax y of Y P(D|Y=y)P(Y =y)
# Equivalently, P(X1,.....Xv | Y = y) P(Y =y)
#Introducing the NB assumption of class conditional indepdence:
#(Product from i to V P(Xi | Y = y)) * P(Y = y)
#Applying a logarhmic transformation : 
# (Sum for i to V P(Xi | Y = y)) + P(Y = y)
#yHat is a column vector of all predicted labels of X
#D is our data likelihood
#p is the prior probability of the label

function [yHat] = NB_Classify (D,p,X)
  Test_size = size(X,1);
  yHat = zeros(Test_size,1);
  for i = 1:Test_size
    economist_data_likelihood = D(1,:) .* X(i,:) + (1-D(1,:)) .* (1-X(i,:));
    onion_data_likelihood = D(2,:) .* X(i,:) + (1-D(2,:)) .* (1-X(i,:));
    economist_prob = logProd([log(economist_data_likelihood),log(p)]);
    onion_prob = logProd([log(onion_data_likelihood),log(1-p)]);
    if economist_prob > onion_prob
      yHat(i) = 1;
    else
      yHat(i) = 2;
    endif
  endfor
endfunction
