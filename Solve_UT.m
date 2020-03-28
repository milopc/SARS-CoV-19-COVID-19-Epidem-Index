function [x] = Solve_UT(U,b)
%Solve_UT Function that solves an upper triangular system
%   This function takes two inputs, an upper triangular matrix and a vector
%   of constant numbers. It will return a vector of the numbers we need so
%   that all the equations are true.
n = length(b);
x = zeros(n,1);
x(n) = b(n)/U(n,n);
for j=n-1:-1:1
    acum = 0;
    for i=j+1:n
        acum = acum + U(j,i)*x(i);
    end
    x(j)=(b(j)-acum)/U(j,j);
end
end
