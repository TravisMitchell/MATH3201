% Week 6 Practical:
%   Problem 1:
%     Solve the IVP,
%       y' = -5y, y(0) = 2 and h = 0.5 
%     using the explicit Euler method

f  = @(t, y) -5 * y;
y0 = 2;
t0 = 0; tf = 5;
h  = 0.5;
[tVals, yVals] = myEuler(t0, tf, y0, f, h);
plot(tVals,yVals)

%   Problem 2:
%     Solve the IVP,
%       y' = -5y, y(0) = 2 and h = 0.5 
%     using the explicit Euler method
clear all
f  = @(t, y) -5 * y;
y0 = 2;
t0 = 0; tf = 5;
h  = 0.5;
[tVals, yVals] = myImplicitEuler(t0, tf, y0, f, h);
plot(tVals,yVals)

%   Problem 3:
%     Solve the IVP,
%       y'' - 2y' + 2y = exp(2t), y(0) = -0.4 and y'(0) = -0.6 
%     using RK4
%     Therefore, we can rewrite this as w = y', w' = y'':
%       | y' | = | 0  1 | | y | + | 0       |
%       | w' |   |-2  2 | | w |   | exp(2t) |
%     with I.C. | y | = |-0.4|
%               | w |   |-0.6|
clear all
F = @(t, y) [0,1;-2,2] * y + [0;exp(2*t)];
t0 = 0; tf = 1;
h = 0.01;
y0 = [-0.4,-0.6]';
[tVals, yVals] = myRK4(t0, tf, y0, F, h);
y = @(t) 0.5*exp(t).*(exp(t)-1.4*sin(t)-1.8*cos(t)); %Analytical soln 
plot(tVals,y(tVals),'b.',tVals,yVals(1,:),'r-')

%   Problem 4:
%     Solve the BVP,
%       y'' = y' + 2y + cos(x), y(0) = -0.3 and y(pi/2) = -0.1 
%     using Shooting method
%     Therefore, we can rewrite this as w = y', w' = y'':
%       | y' | = | 0  1 | | y | + | 0       |
%       | w' |   | 2  1 | | w |   | cos(x)  |
clear all
F = @(t, y) [0,1;2,1] * y + [0;cos(t)];
y0 = -0.3; yf = -0.1;
t0 =  0.0; tf =  pi/2;
h  = 0.01;
Shoot = @(alpha) yf - myRK4shoot(t0, tf, [y0; alpha],F,h); 
ydash0 = fzero(Shoot, 0.1);
[tVals, yVals] = myRK4(t0, tf, [y0;ydash0], F, h);
plot(tVals,yVals(1,:),'r-',[t0,tf],[y0,yf],'bo')
