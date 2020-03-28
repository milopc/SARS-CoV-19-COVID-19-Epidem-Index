function x = Solve_LT(L,b)
    %Solve_LT Function that solves a lower triangular system
    %   This function takes two inputs, a lower triangular matrix and a vector
    %   of constant numbers. It will return a vector of the numbers we need so
    %   that all the equations are true.
    n = length(b);
    x = zeros(n,1);
    x(1) = b(1)/L(1,1);
    for i=2:n
        acum = 0;
        for j=1:i-1
            acum = acum + L(i,j)*x(j);
        end
        x(i)=(b(i)-acum)/L(i,i);
    end
    end

