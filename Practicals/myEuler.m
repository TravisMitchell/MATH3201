function [tVals, yVals] = myEuler(t0, tf, y0, f, h)
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
   
   tVals = t0:h:tf;           % Make tVals array
   n = length(tVals);
   yVals = zeros(1,n);        % Allocate memory for yVals
   
   yVals(1) = y0;
   for i = 1:n-1
     yVals(i+1) = yVals(i) + h*f(tVals(i), yVals(i));
   end
    
end  