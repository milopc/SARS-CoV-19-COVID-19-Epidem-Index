function [v] = row_Elim(v,d)
%infect_Elim Is a function that eliminates the rows of the v vector according to the d vector entrances. 
%   The v vector contains some rows we don't need. 
%   The d vector is a boolean vector that has 1 in the entrances that we
%   dont want and 0 in the entrances that will remain.
n = length(v);
for i = n:-1:1 %This iteration occurse backwards
    if d(i) == 1 %This process verifies if the d vector's i entrance is activated.
        v(i) = []; %This removes the i entrance
    end
end

