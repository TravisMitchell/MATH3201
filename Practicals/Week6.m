% Week 6 Practical:
%   Problem 1:
%     Solve the IVP,
%       y' = -5y, y(0) = 2 and h = 0.5 
%     using the explicit Euler method

f  = @(t, y) -5 * y;
y0 = 2;
t0 = 0; tf = 5;
h  = 0.5;
[tVals, yVals] = myEuler(t0, tf, y0, f, h)
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
[tVals, yVals] = myImplicitEuler(t0, tf, y0, f, h)
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
[tVals, yVals] = myRK4(t0, tf, y0, F, h)
plot(tVals,yVals)

