% Simpson's 1/3rd rule
k=1; a=0; b=1.57;
f=@(theta) (1/sqrt(1-(k^2)*(sin(theta))^2));
N=10001; h=(b-a)/(N-1);
x=linspace(a,b,N);
I=0;
for i=1:2:N-2
    I=I+(h/3)*(f(x(i))+4*f(x(i+1))+f(x(i+2)));
end
disp(I);