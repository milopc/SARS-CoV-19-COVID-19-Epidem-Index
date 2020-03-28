%                    MAIN for
%    COVID-19 project - Computational Mathematics
%     Authors: Salvador Rodriguez-Carrasco 171943
%              Emiliano Padilla-Cardona 166136
%          Last modification: 18/03/2020


%FIRST we read the excel file containing the data available on Mexico's Population according to INEGI (2010 census).
[population,states] = xlsread ('INEGI_Data.xlsx',1,'A1:B32','basic');


%SECOND we turn cell array "states" into string array, containing the names of the states, with indexes corresponding to the indexes of the populations in "population".
states = string(states);


%THIRD we read the excel file containing a matrix of 32X32 of boolean entries (0 and 1), where 1 means state i (in row i) neighbors state j (in column j); 0 means the they're not neighbors.
neighbors = xlsread ('Neighboring_State_Data.xlsx',1,'A1:AF32','basic');


%FOURTH we read the excel file containing the vectors of initial infected population states, I1, I2, and I3.
[NUM,I1] = xlsread ('State_Infection_Data.xlsx',1, 'A1:A4', 'basic');
[NUM,I2] = xlsread ('State_Infection_Data.xlsx',1, 'B1:B4', 'basic');
[NUM,I3] = xlsread ('State_Infection_Data.xlsx',1, 'C1:C4', 'basic');

I1 = string (I1)
I2 = string (I2)
I3 = string (I3)


%FIFTH we read the excel file containing the vectors of percentage of initial infected population for the states in I1, I2, and I3: P1,P2, and P3.
P1 = xlsread ('State_Infection_Data.xlsx',2, 'A1:A4', 'basic');
P2 = xlsread ('State_Infection_Data.xlsx',2, 'B1:B4', 'basic');
P3 = xlsread ('State_Infection_Data.xlsx',2, 'C1:C4', 'basic');


%SIXTH we generate a boolean vector, MI, containing 1 in the state (by index) had initial infected population, and 0 if it hadn't. We do this for MI1, MI2, and MI3. Also, we generate a value vector, PI, containing the values in P for the states in I, according to their index in the states vector.
[PI1,MI1] = infectoread (states,I1,P1);
[PI2,MI2] = infectoread (states,I2,P2);
[PI3,MI3] = infectoread (states,I3,P3);



%SEVENTH we generate three different equation systems using our
%function index_Epid.
[A1,b1] = index_Epid (neighbors,MI1,PI1);
[A2,b2] = index_Epid (neighbors,MI2,PI2);
[A3,b3] = index_Epid (neighbors,MI3,PI3);


%EIGTH we demonstrated that the Ai (i = 1,2,3) matrix is a diagonally
%dominant matrix. Therefore, it is a symmetric positive definite matrix, so
%it accepts Cholesky factorization.
L1 = chol (A1, 'lower');
L2 = chol (A2, 'lower');
L3 = chol (A3, 'lower');

%NINTH we solve the systems in two steps, first we solve Li*vi = b1, and
%then Li'*wi = vi (i = 1,2,3)
v1 = Solve_LT(L1,b1);
v2 = Solve_LT(L2,b2);
v3 = Solve_LT(L3,b3);

w1 = Solve_UT(L1',v1);
w2 = Solve_UT(L2',v2);
w3 = Solve_UT(L3',v3);

%TENTH we have three different cases and need the population vectors of the
%not infected federative entities for each scenario.
pop1 = row_Elim(population,MI1);
pop2 = row_Elim(population,MI2);
pop3 = row_Elim(population,MI3);
edos1 = row_Elim(states,MI1);
edos2 = row_Elim(states,MI2);
edos3 = row_Elim(states,MI3);


%ELEVENTH we do an entrance to entrance multiplication wi*popi (i = 1,2,3)
%for the not infected states and associate the federative entity with the
%number of susceptible people to be infected. Also, we associate the federative entities that have already been
%infected with it's infected population
susceptiblePop1 = round(w1.*pop1);
susceptiblePop2 = round(w2.*pop2);
susceptiblePop3 = round(w3.*pop3);


OP1 = infectedpp(states,population,I1,P1)
Case1 = [edos1 (susceptiblePop1)]
OP2 = infectedpp(states,population,I2,P2)
Case2 = [edos2 (susceptiblePop2)]
OP3 = infectedpp(states,population,I3,P3)
Case3 = [edos3 (susceptiblePop3)]