function [PI,MI] = infectoread (states,initial_s,pperc)
    %        FUNCTION: infectopop (states,initial_s,pperc)
    %    This function creates a vector of zeros and the values in pperc for a
    %    predetermined amount of states. The function works on a process that
    %    asks for the indexes of the initial_s elements in states and then
    %    changed the values of a zero vector of length=length (states) to the
    %    values of each state in pperc. It also generates vector MI, where it
    %    does the same process, only instead of changing values in zero vector
    %    of length = length (states) to pperc, it changes them to 1 (boolean).
    
    %    INPUT:
    % - states: list of all states in a country
    % - initial_s: list of the states in such country with initial infection
    %                greater than 0.00% (i.e. where epidemic started)
    % - pperc: list of the percentage of initially infected population in the
    %                states in initial_s
    
    %    PROGRAM:
    % 1. We get the length of the states and initial_s vectors, in orden to gather
    %    information on the amount of states in each and create initial infected
    %    population vector, PI.
    n = length (states);
    m = length (initial_s);
    % 2. We now create zero vectors of length n, PI and MI.
    PI = zeros (n,1);
    MI = zeros (n,1);
    % 3. We read the states in initial_s vector and gather their index in states
    %    vector, then change their value in PI from 0 to pperc(i) and in MI from
    %    0 to 1
    for i = 1:m
        idx = find(states==initial_s(i));
            %THIS VARIABLE IS THE INDEX OF THE STRING initial_s(i) IN VECTOR states
        PI(idx) = pperc(i);
            %THIS CHANGED THE VALUE FOR THE GIVEN state(idx) IN PI TO pperc(i)
        MI(idx) = 1;
            %THIS CHANGES THE BOOLEAN VALUE FOR THE GIVEN state(idx) IN MI TO 1
    end