%% 3D brownian motion
% Distance is predicted by a number from a normal distribution
% Direction is completely random

mean=1;
variance=2;

N=1000; x=zeros(1,N); y=zeros(1,N); z=zeros(1,N);

for k=2:N
%   A number from Normal distribution gives s;
    s=abs(mean + sqrt(variance)*randn(1,1));
    phi=2*pi*rand;
    theta=pi*rand;
    x(k)=x(k-1)+s*sin(theta)*cos(phi);
    y(k)=y(k-1)+s*sin(theta)*sin(phi);
    z(k)=z(k-1)+s*cos(theta);
end

comet3(x,y,z);