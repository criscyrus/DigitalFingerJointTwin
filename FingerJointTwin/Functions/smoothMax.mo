within FingerJointTwin.Functions;

function smoothMax
  input Real x;
  input Real delta = 1e-4 "Smoothing width";
  output Real y;
algorithm
  // smooth approximation of max(0,x)
  y := 0.5*(x + sqrt(x*x + delta*delta));
end smoothMax;
