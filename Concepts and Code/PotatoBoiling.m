R=0.04;k=0.05;
K=0.8;c=3390;rho=1070;
a=K/(c*rho);
M=101;N=30001;
h=R/(M-1);

r=a*k/(h^2);
u=zeros(M,N);
% x = linspace(0,R,h);
x = 0:h:R;

T0=100;
n1=1;
u(1:M-1,1)=25;u(M,1)=T0;
while u(1,n1) < 70
    for m = 2:M-1
        u(m,n1+1) = (1-2*r)*u(m,n1) + r*((m-2)*u(m-1,n1)+m*u(m+1,n1))/(m-1);
    end
    u(1,n1+1) = u(2,n1+1);
    u(M,n1+1) = T0;
    n1 = n1 +1;
end
T_warming = k*(n1-1)/60;
fprintf("The time required for heating the potato is: %0.2f mins\n\n",T_warming);

T0=25;
n2=n1+1;
u(1:M-1,n2)=u(1:M-1,n1);u(M,n2)=T0;
while u(1,n2) >= (T0 + 5)
    for m = 2:M-1
        u(m,n2+1) = (1-2*r)*u(m,n2) + r*((m-2)*u(m-1,n2)+m*u(m+1,n2))/(m-1);
    end
    u(1,n2+1) = u(2,n2+1);
    u(M,n2+1) = T0;
    n2 = n2 +1;
end
T_cooling = k*(n2-n1-1)/60;
fprintf("The time required for cooling the potato is: %0.2f mins\n",T_cooling);

subplot(2,2,1)
hold on
for i=4000:4000:n1
plot(x,u(:,i),'linewidth',1.5)
end
plot(x,u(:,n1),'linewidth',1.5)
title('Heating Phase')
xlabel('Distance from Center')
ylabel('Temperature')
grid on
hold off

subplot(2,2,2)
hold on
for i=n1+3000:7000:n2
plot(x,u(:,i),'linewidth',1.5)
end
plot(x,u(:,n2),'linewidth',1.5)
title('Cooling Phase')
xlabel('Distance from Center')
ylabel('Temperature')
grid on
hold off

subplot(2,2,3)
plot(u(1,:),'linewidth',1.5)
title('Temperature at Center')
xlabel('Time')
ylabel('Temperature at center')
grid on