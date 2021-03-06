% TEST DH PARAMETERS TABLE FOR AN "R-R-R" ROBOT
% Santiago Garcia Arango

% Access upper folder functions
addpath(genpath("../"));

% Define Symbolic variables and assume they are real (avoid "complex")
syms theta1 theta2 theta3 L L1 L2 L3
assume(theta1, "positive");
assume(theta2, "positive");
assume(theta3, "positive");
assume(L, "positive");
assume(L1, "positive");
assume(L2, "positive");
assume(L3, "positive");


% Define DH table of parameters
DH_TABLE = [   0,  L,  0, theta1 - pi/2;
               0, L1,  0, theta2 - pi/2;
               0, L2,  0, theta3 + pi/2;
            pi/2,  0, L3,              0]

% Main functions to obtain TM and values for position and rotation
[TM, cell_of_TM] = denavit_hartenberg(DH_TABLE);


% We show the simplified version of final TM, position and rotation
% "simplify" lets us show the simplest version of symbolic expression
TM = simplify(TM, 'IgnoreAnalyticConstraints', true)


% Get the main Positions vector from main TM
P_xyz = TM(1:3,4);
JJ = simplify(jacobian(P_xyz, [theta1, theta2, theta3]))



