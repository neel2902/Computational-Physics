function [I]= GaussQuad(Fun,a,b,N)

%******************************************************************************
% The inputs to the function are Fun, the function which is to be integrated, which could be an
% anonymous function or user defined function, x1 & xN, the two limits of integration, N, the
% number of integration points.
%******************************************************************************

syms r ;
roots = solve(legendreP(N,r));
roots = double(roots);

%*****************************************************************************
% The N roots of the Legendre polynomial of order N are %computed above by using the MATLAB
% function solve.
%******************************************************************************

p=(b-a)/2; q=(b+a)/2;
y=p*Fun(p*roots+q);
y=double(y);

%****************************************************************************
% The values of the function to be integrated are %calculated at the roots of the Legendre
% polynomial after suitably squeezing it into the interval [-1,1].
%***************************************************************************

z=diff(legendreP(N,r),r,1);
z=double(subs(z,r,roots));
w=2./((1-roots.^2).*(z.^2));

I=sum(w.*y);
end


%*******************************************************************************
% The weights at the roots of the Legendre polynomial %are calculated above by using appropriate
%  formulas for weights calculation.
%******************************************************************************