% Solve the wave equation:
%       u_tt = c.u_xx
% c=1, u(x,0) = sin(pi x/L), u_t(x,0) = 0
% on the Domain 0<=x<=L . u(0,t) = u(L,t) = 0

%@TMitchell - 16.05.19
% Define System:
c = 1;
L = 2;
T = 2;
% Define Discretisation:
dx = 0.01; dt = 0.005;
x = 0:dx:L; m = length(x);
t = 0:dt:T; n = length(t);
u = zeros(m,n);

% Define Initial conditions
u(:,1) = sin(pi * x/L);
u(:,2) = u(:,1); % Given u_t(x,0) = 0

for time = 3:n
    %Interior update
   u(2:m-1,time) = 2*u(2:m-1, time-1) - u(2:m-1,time-2) + ...
                 (c*dt/dx)^2 * ...
                 (u(3:m,time-1)-2*u(2:m-1, time-1)+u(1:m-2,time-1));
    %Boundary values
    u(1,time) = 0;
    u(m,time) = 0;
end

%plot me:
for iter = 1:n
    plot(x,u(:,iter), 'bo', x, sin(pi*x/L)*cos(c*pi*(iter-1)*dt/L), 'r-')
    ylim([-1 1]); drawnow; pause(0.1)
end

