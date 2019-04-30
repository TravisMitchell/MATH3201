function []=Week09p2()
xa=0.0;  xb=1.0;  ya=1.0; yb=1.0+cosh(1.0);
N=16;

%Set up matrix
dx=(xb-xa)/(N)
sigma=dx^2;

A=zeros(N-1,N-1);
A(1,1)=-2.0-sigma;
A(1,2)=1;
% Internal sites
for j=2:N-2
    A(j,j-1)=1.;
    A(j,j)=-2.-sigma;
    A(j,j+1)=1;
end
A(N-1,N-1)=-2.0-sigma;
A(N-1,N-2)=1;

% or we can use:
% A = diag( (-2-sigma)*ones([N-1,1]) ) …	% Main Diagonal
%     + diag( ones([N-2,1]), 1) 	   …	% Upper Diagonal
%     + diag( ones([N-2,1]),-1);		% Lower Diagonal
A;

% x vector for plots
x=zeros(N-1,1);
for j=1:N-1
    x(j)=xa+dx*j;
end

% Boundary conditions
b=zeros(N-1,1);
b(1)=-ya;
b(N-1)=-yb;
for j=1:N-1
    b(j)=b(j)-x(j)*dx^2;
end

yapp=A\b;


Ne=40;
% x vector for plots
xexact=linspace(xa,xb,41);
yexact=(cosh(xexact)+xexact);


figure(1)
plot(x,yapp,'o',xexact,yexact)

midpoint=(N)/2
Error=(cosh(0.5)+0.5)-yapp(midpoint)
Ratio=Error/(dx^2)

end
