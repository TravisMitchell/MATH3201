function [tVals, yVals] = myRK4(t0, tf, y0, f, h, dimension)
  % This function looks to solve an IVP. It takes:
  %    t0: an initial time / location
  %    tf: a final time to evaluate until
  %    y0: an initial value 
  %     f: the derivative of our function y
  %     h: the step size to take
  
  % @TravisMitchell
  % 27-03-2019
  
   if isa(f, 'function_handle')
     disp('Integrating function f (make sure f allows a vector input!):');  
     disp(f);
   else
     error('Please input f as a callable function');
   end
   if ~exist('dimension','var')
     dimension = 1;
   end
      
   tVals = t0:h:tf;           % Make tVals array
   n = length(tVals);
   yVals = zeros(dimension,n);        % Allocate memory for yVals
   
   yVals(:,1) = y0;
   for i = 1:n-1
     k1 = f(tVals(i), yVals(:,i));
     k2 = f(tVals(i)+h/2, yVals(:,i)+h*k1/2);
     k3 = f(tVals(i)+h/2, yVals(:,i)+h*k2/2);
     k4 = f(tVals(i) + h, yVals(:,i)+h*k3);
     yVals(:,i+1) = yVals(:,i) + h*(k1/6 + k2/3 + k3/3 + k4/6);
   end
end  