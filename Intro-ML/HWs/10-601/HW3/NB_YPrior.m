## Copyright (C) 2020 Christopher Benka
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} NB_YPrior (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Christopher Benka <chris@Chris-Computer>
## Created: 2020-01-12

##Given a vector of labels y, where the ith component of y = {1,2},
##calculate the MLE for p = P(Y = 1)

## y = Bernouli(p)
## The MLE for a Bernouli r.v. is the emperical count of y = 1 /|y|
function [p] = NB_YPrior (y)
  size_data = size(y,1)
  emperical_count_y_one = size(y(y == 1),1)
  p = emperical_count_y_one / size_data
endfunction
