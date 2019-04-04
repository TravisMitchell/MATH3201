function [yend] = myRK4shoot(t0, tf, y0, f, h, dimension)
   if isa(f, 'function_handle')
     disp('Integrating function f (make sure f allows a vector input!):');  
     disp(f);
   else
     error('Please input f as a callable function');
   end
   if ~exist('dimension','var')
     dimension = length(y0);
   end
   [tVals, yVals] = myRK4(t0, tf, y0, f, h, dimension);
   yend = yVals(1,end);
end

