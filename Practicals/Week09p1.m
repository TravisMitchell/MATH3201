% Begin code - this code uses sub-functions
function []=Week09p1()

% Setup the system for the in-built solver
solinit= bvpinit( linspace(1,2,10), [1 0] )
sol= bvp4c(@odeu,@twobc,solinit);

x=linspace(1,2);
y=deval(sol,x);
ytrue=1/3*x.^(-2)
plot(x,y(1,:),'+',x,ytrue);

ans=y(1,:)

end

% Sub-functions, can be included in the same file
function res=twobc(ya,yb)
res=[ ya(1)-1/3   yb(1)-1/12 ];
end

function du=odeu(t,u)
du=zeros(1,2); %output row vector
du(1)=u(2);
du(2)=18.*u(1)^2;
%du(2)=-abs(u(1));
end
% End code 
