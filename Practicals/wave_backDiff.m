function [w,decay]=wave_backDiff(sigma)
% This function looks to solve the heat equation using a forward difference
% Pretty sure the author is T. Roberts

% Comments and such added by T. Mitchell (May, 2019)
M=10;
L=2.0;
dx=L/M;
x=0:dx:L;

D = 0.5;

%sigma = 0.006;
dt = sigma * dx^2 / D;
Nt=400;
T=dt*Nt;
% Zeroth time step
w=icf1(x,L);
cold=w(2:M)' ; % Copy into vector of length M-1

% Set up matrix
A=zeros(M-1);
A(1,1)=1+2*sigma;
A(1,2)=-sigma;
i=M-1;
A(i,i)=1+2*sigma;
A(i,i-1)=-sigma;

for i=2:M-2
  A(i,i-1)=-sigma;
  A(i,i)=1+2*sigma;
  A(i,i+1)=-sigma;
end

% Main iteration
iA=inv(A);
for k=1:Nt
    c=iA*cold;
    for i=1:M-1
      cold(i)=c(i);
    end
end

w(1)=0.0;
w(2:M)=cold';
w(M+1)=0.0;
% Plot result
wex=exact1(x,T,D,L);
decay=exp(- D* pi^2 *T / L^2);
plot(x,w,'o',x,wex)

end

function [f]=icf1(x,L)
f=sin(pi*x/L);
end

function [ex]=exact1(x,t,D,L)
ex=sin( pi*x / L ) .*exp(- D* pi^2 *t / L^2);
end

