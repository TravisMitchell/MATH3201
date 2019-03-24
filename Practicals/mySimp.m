function myInt = mySimp(f, a, b, N)
  % This function takes a function f and integrates it between bounds a and b
  % with N intervals.
  
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
  
  myInt = (h/3) * ( sum(fVals(1:2:end-2)) + ...
                  4*sum(fVals(2:2:end-1)) + ...
                    sum(fVals(3:2:end)) );
end
