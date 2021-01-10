% Electric Potential Of A Sphere carrying charge density
% Point where we want to find out at a distance r
r=0.5; 
M=101;
h=pi/(M-1);
theta=0:h:pi; phi=pi/3;
V=zeros(1,M);

% Points on the surface of the sphere
N=100000;

for m=1:M
    X=r*sin(theta(m))*cos(phi);
    Y=r*sin(theta(m))*sin(phi);
    Z=r*cos(theta(m));
    
    for n=1:N
        
        th=acos(1-2*rand);
        ph=2*pi*rand;
        
        x=sin(th)*cos(ph);
        y=sin(th)*sin(ph);
        z=cos(th);
        
        V(m)=V(m)+cos(th)/(sqrt((x-X)^2+(y-Y)^2+(z-Z)^2));
    end
    
end

V=4*pi*V/N;
Vout=4*pi.*cos(theta)./(3*r.^2);
Vin=(4*pi/3)*r*cos(theta);

hold on
plot(theta, V, 'b', 'linewidth', 1.5);
plot(theta, Vout, 'g', 'linewidth', 1.5);
plot(theta, Vin, 'r', 'linewidth', 1.5);
ylabel("Potential");
xlabel("Theta");
hold off
grid on


