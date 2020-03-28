function OP = infectedpp (states,population,initial_s,pperc)
    %        FUNCTION: infectedpp (states, population, I, ippp)
    %   This function reads the states where the infection started, that is,
    %   the elements of I, then searches for that state's index in states,
    %   matches it to the element in population with the same index, and then
    %   multiplies that population amount with the element in ippp (vector
    %   containing the portions of initial infected population) with their
    %   corresponding state's portion. It returns a matrix containing the
    %   state's name in the first column, and the amount of initially infected
    %   population in the other, OP (for observed infected population)
    
    %    INPUT:
    % - states: list of all states in a country
    % - population: list containing current population per state
    % - initial_s: list of the states in such country with initial infection
    %                greater than 0.00% (i.e. where epidemic started)
    % - pperc: list of the percentage of initially infected population in the
    %                states in initial_s
    
    %    PROGRAM:
    % 1. We get the length of the states and initial_s vectors, in orden to gather
    %    information on the amount of states in each and create the OP matrix
    n = length (states);
    m = length (initial_s);
    % 2. We now create a zero vector, op, of sizes (m,1)
    op = zeros(m,1);
    % 3. We read the states in initial_s vector with their index, i, and gather
    %    their index, j, in states. We find i in states, get j, get j of population
    %    and then multiply population(j)*pperc(i)
    for i = 1:m
        j = find(states==initial_s(i));
        op(i) = population(j)*pperc(i);
    end
    OP = [initial_s round(op)];
end