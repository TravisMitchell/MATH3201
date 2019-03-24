function myInt = myTrap(f, a, b, N)
  % This function takes a function f and integrates it between bounds a and b
  % with N trapezoids.
  
  % @TravisMitchell
  % 22-03-2019
  
  if isa(f, 'function_handle')
    disp('Integrating function f (make sure f allows a vector input!):');  
    disp(f);
  else
    error('Please input f as a callable function');
  end
  
  h = (b-a)/N;
  xVals = linspace(a,b,N+1);
  fVals = f(xVals);
  
  myInt = h* ( 0.5*(fVals(1) + fVals(end)) + sum(fVals(2:end-1)));
end  
