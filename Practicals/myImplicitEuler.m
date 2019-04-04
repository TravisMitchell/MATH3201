function [tVals, yVals] = myImplicitEuler(t0, tf, y0, f, h)
  % This function looks to solve an IVP. It takes:
  %    t0: an initial time / location
  %    tf: a final time to evaluate until
  %    y0: an initial value 
  %     f: the derivative of our function y,given as f(t,y)
  %     h: the step size to take
  
  % @TravisMitchell
  % 04-04-2019
  
  tVals = t0:h:tf;
  N = length(tVals);
  yVals = zeros(1,N);
  yVals(1) = y0;
  
  for i = 1:N-1
    tempFun = @(y) y - yVals(i) - h*f(tVals(i+1), y)  ;
    yVals(i+1) = fzero(tempFun, yVals(i));
  end
end  