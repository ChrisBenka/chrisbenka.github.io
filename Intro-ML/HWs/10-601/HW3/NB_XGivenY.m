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

#calculate the data_likelihood of XTrain given yTrain
#output D is a 2 X V matrix, where for any word w in {1,....,V} and class index
# y in {1,2}, the entry D(y,w) is the MAP estimate of Theta y w = P(xw = 1 | Y = y)
#with a Beta(2,1) prior distribution

# The map Estimate of xw | y where x is distributed according to a Bernouli distribution ( x = 1 if present in article, 0 otherwise)
# of P(Xw = 1 | Y = y) is: 
# emperical count of Xw = 1 for Y = y + hallucinated 1's / |y| + #hallucinated examples 
# --------------------------------------------
# number of training examples with label Y = y  + hallucinated examples / |Y| + hallucinated examples

# hallucinated 1's : 2 - 1 = 1, hallucinated 0's : 1 - 1  = 0, total hallucinated examples = 1 + 0 = 1


function [D] = NB_XGivenY (XTrain, yTrain)
  #combine and seperate training examples by class label
  data = [XTrain,yTrain]
  labeled_one_data = data(data(:, end) == 1, :);
  labeled_two_data = data(data(:, end) == 2, :);  
  #Calculate how many examples contain a given Xw
  num_times_exists_label_one = sum(labeled_one_data,2)
  num_times_exists_label_two = sum(labeled_two_data,2)
  #add in our hallucinated examples
  hallucinated_examples_one = 1
  hallucinated_examples_two = 0
  num_times_exists_label_one = num_times_exists_label_one + hallucinated_examples_one
  num_times_exists_label_two = num_times_exists_label_two + hallucinated_examples_two
  #calculate MAP estimates
  D = [num_times_exists_label_one / (size(labeled_one_data,1) + hallucinated_examples_one),
  num_times_exists_label_two / (size(labeled_two_data,1) + hallucinated_examples_two)]
endfunction
