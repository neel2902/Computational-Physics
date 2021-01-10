% N-Dimensional Gaussian function integral over a cube;
sigma=2; a=-10; b=10;
N=1;
f=@(x) exp(-sum(x.^2)/(2*sigma^2))/(sqrt(2*pi)*sigma)^N;

g=@(x) 6*x.*(1-x);
M=100000; k=0;
volumeCuboid=(b-a)^N;
I=0;
for p=1:M
    x=a+(b-a)*rand(1,N);
    I=I+f(x);
end
I=(I/M)*volumeCuboid;

disp(I);
    