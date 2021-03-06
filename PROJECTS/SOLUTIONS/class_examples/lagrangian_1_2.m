% PART 2 OF LAGRAGIAN EXAMPLE OF "PR" ROBOT
% Santiago Garcia Arango
clc; clear variables;
format short;
sympref('FloatingPointOutput',true);


% Define main system variables (keep look at part one to see why)
syms m1 m2 Izz1 Izz2; % Variables related to mass and inertia
syms x1 x1d x1dd x2 x2d x2dd; % Variables related to energy
syms Lcm1; % Variables related to distances
syms g; % Gravity

% Main Lagrange equation (found in part one to see result)
L = 0.5000*m2*(sin(x1)*x2d + cos(x1)*x2*x1d)^2 + 0.5000*m2*(cos(x1)*x2d - sin(x1)*x2*x1d)^2 + 0.5000*Izz1*x1d^2 + 0.5000*Izz2*x1d^2 + 0.5000*Lcm1^2*m1*cos(x1)^2*x1d^2 - g*m2*sin(x1)*x2 + 0.5000*Lcm1^2*m1*sin(x1)^2*x1d^2 - Lcm1*g*m1*sin(x1)
L = simplify(L)

% We do the necessary partial derivatives... 
% First arm
pLpx1d = diff(L,x1d);  % Partial derivative of L with respect of the time derivative of x1
ddtpLpx1d = diff(pLpx1d,x1)*x1d+ ...
             diff(pLpx1d,x1d)*x1dd+ ...
             diff(pLpx1d,x2)*x2d + ...
             diff(pLpx1d,x2d)*x2dd;
pLpx1 = diff(L,x1);

% Second arm
pLpx2d = diff(L,x2d);
ddtpLpx2d = diff(pLpx2d,x1)*x1d+ ...
             diff(pLpx2d,x1d)*x1dd+ ...
             diff(pLpx2d,x2)*x2d + ...
             diff(pLpx2d,x2d)*x2dd;
pLpx2 = diff(L,x2);

% Find forces of torques of the system...
% First arm
u1 = ddtpLpx1d - pLpx1;
u1 = collect(simplify(u1),x1dd)

% Second arm
u2 = ddtpLpx2d - pLpx2;
u2 = collect(simplify(u2),x2dd)
