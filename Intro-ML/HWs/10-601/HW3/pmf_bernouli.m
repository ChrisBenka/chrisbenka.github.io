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
## @deftypefn {} {@var{retval} =} pmf_bernouli (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chris Benka <chrisbenka@lpc-depaulsecure-219-177.depaulsecure-student.depaul.edu>
## Created: 2020-01-12

function p = pmf_bernouli (p, x)
  return (p ** x) * (p ** (1-x))
endfunction
