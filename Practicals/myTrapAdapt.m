function myInt = myTrapAdapt(f, a, b, myTol)
  % This function takes a function f and integrates it between bounds a and b
  % with an adaptive trapezoidal rule.
  
  % @TravisMitchell
  % 22-03-2019
  trap_Area = @(a0,b0) 0.5*(f(a0) + f(b0))* (b0-a0);
  
  if isa(f, 'function_handle')
    disp('Integrating function f (make sure f allows a vector input!):');  
    disp(f);
  else
    disp('Please input f as a callable function');
    break;
  end
  
  % Initialise useful variables
  myInt = 0;
  n   = 1;
  x0(1) = a; xn(1) = b;
  area(1) = trap_Area(a,b);
  tol(1) = myTol;
  
  while n > 0
    midPoint = 0.5 * (x0(n) + xn(n));
    oldArea = area(n);
    area(n)  = trap_Area(x0(n), midPoint);
    area(n+1)= trap_Area(midPoint, xn(n));
   
    if abs(oldArea - (area(n) + area(n+1))) < 3 * tol(n) 
      myInt = myInt + (area(n) + area(n+1));
      n = n-1;
    else
      xn(n+1) = xn(n); xn(n) = midPoint;
      x0(n+1) = midPoint;
      tol(n) = tol(n)/2; tol(n+1) = tol(n);
      n = n+1;
    end
  end
end