function [wnew,decay]=wave_forwardDiff()
% This function looks to solve the heat equation using a forward difference
% Pretty sure the author is T. Roberts

% Comments and such added by T. Mitchell (May, 2019)
M=10;       % Number of intervals
L=2.0;      % Spatial domain length
dx=L/M;     % Discrete point spacing
x=0:dx:L;

Tmax=1.0    % End simulated time
dt=0.04;    % Time step
Nt=Tmax/dt; % Number of time steps

D=0.5; 

%Check Stability:
sigma = dt*D/dx^2;
if sigma > 0.5
    disp(['Update your stabilisers... CFL =', num2str( sigma )])
    return
end

% Zeroth time step
wold = icf1(x, L); %calculate the initial condition
wnew = wold;    %initialise wnew for memory
% Boundary conditions
wold(1  )=0.;
wold(M+1)=0.;

% Main iteration
for k=1:Nt
    for i=2:M
      wnew(i)=wold(i)+sigma*(wold(i-1)-2.*wold(i)+wold(i+1));
    end
    % Apply boundary conditions
    wnew(1)=0.;
    wnew(M+1)=0.;
    wold=wnew;
end

% Plot result
wex=exact1(x,Tmax,D,L);
decay=exp(- D* pi^2 *Tmax / L^2);
plot(x,wnew/decay,'o',x,wex/decay)
axis([0 2 0 1.5])
%ans=1;

end

function [f]=icf1(x,L)
f=sin(pi*x/L);
end

function [ex]=exact1(x,t,D,L)
ex=sin( pi*x / L ) .*exp(- D* pi^2 *t / L^2);
end
