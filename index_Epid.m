function [A,b] = index_Epid(F,d,p)
%index_Epid generates a square system that helps us get the epidemiological index for each federative entity that is still not infected.
%   F is a boolean(0/1) matrix that indicates frontiers between federative entities alphabetically ordered(and is symmetric). 
%   d is a boolean(0/1) vector that indicates which federative entities are infected on the initial phase.
%   p is a vector that contains the proportion of the infected people on the infected federal entities.
m = length(d); %This variable will be used to iterate over the F matrix and the vectors we are using.
n = zeros(m,1); %This vector will store the number of neighbors that each federative entity has.
b = zeros(m,1); %This vector will contain the independent coefficients of the system. It's j entrance will be the sum of the percentage of infected people on the neighboring states of j.
for j=1:m %Iteration over columns
    n(j)=sum(F(:,j)); %I'm filling up this vector using the matrix F. The j entrance must be the sum of all the neighbors of the j state.
    for i=1:m %Iteration over rows
        if F(i,j) + d(i) == 2 %This process verifies, for every j state, if the i state is a neighbor and if it is infected
            b(j)=b(j)+p(i); %If the condition is satisfied, then I accumulate the percentages on the b vector
        end
    end
end
for i=m:-1:1 %This is iterating backwards
    if d(i) == 1 %This process eliminates the rows and columns of the infected states (because we are not looking for their epidemiologic index).
        F(i,:) = [];
        F(:,i) = [];
        n(i) = [];
        b(i) = [];
    end
end
N = diag(n+1); %This creates a diagonal matrix that contains the number of neighboring states + 1 on it's main diagonal.
A = N-F; %This is the squared matrix associated with the system
%Also, the b vector is finished
end

