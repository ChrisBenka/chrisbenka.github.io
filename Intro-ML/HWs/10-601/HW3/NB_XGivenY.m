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
## @deftypefn {} {@var{retval} =} NB_XGivenY (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Christopher Benka <chris@Chris-Computer>
## Created: 2020-01-12

function [D] = NB_XGivenY(XTrain, yTrain)
  economistRows = XTrain(find(yTrain == 1),:);
  onionRows = XTrain(find(yTrain == 2),:);
  D = [(sum(economistRows,1)+1)/(size(economistRows,1) + 1);(sum(onionRows,1)+1)/(size(onionRows,1) + 1)];
endfunction
 

