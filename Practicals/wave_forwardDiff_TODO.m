function [wnew,decay]=wave_forwardDiff_TODO()
% This function looks to solve the heat equation using a forward difference
% Pretty sure the author is T. Roberts

% Comments and such added by T. Mitchell (May, 2019)

% TODO: Define input parameters
M=  ;       % Number of intervals
L=  ;       % Spatial domain length
D=  ;       % Diffusion coefficient 

dx=L/M;     % Discrete point spacing
x=0:dx:L;   % Define x-domain

Tmax= ;     % End simulated time
dt=   ;     % Desired timestep

Nt=Tmax/dt; % Number of time steps

%Check Stability:
sigma = dt*D/dx^2;
if sigma > 0.5
    disp(['Update your stabilisers... CFL =', num2str( sigma )])
    return
end

% Zeroth time step
wold =     ;    %calculate the initial condition
wnew =     ;    %initialise wnew for memory
% Boundary conditions
wold(1  )= ;
wold(M+1)= ;

% Main iteration
for k=1:Nt
    for i=2:M
      %Finite difference update rule:
      
    end
    % Apply boundary conditions
    
    
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
