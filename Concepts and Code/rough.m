% Euler PDE
% Now convert this to RK2

f1=@(z1,z2) z2;
f2=@(z1,z2) -z1;


N=101;
t=linspace(0,10,N);
h=(10-0)/(N-1);
z1=zeros(1,N); z1(1)=1;
z2=zeros(1,N); z2(1)=0;


for i=2:N
    k11=f1(z1(i-1),z2(i-1));
    k21=f2(z1(i-1),z2(i-1));
    
    
    k12=f1(z1(i-1)+h*k11,z2(i-1)+h*k21);
    k22=f2(z1(i-1)+h*k11,z2(i-1)+h*k21);
    
%     Euler
%     z1(i)=z1(i-1)+h*f1(z1(i-1),z2(i-1));
%     z2(i)=z2(i-1)+h*f2(z1(i-1),z2(i-1));


% RK-2
    z1(i)=z1(i-1)+h*(k11+k12)/2;
    z2(i)=z2(i-1)+h*(k21+k22)/2;
    
    
    

end


plot(t,z1,'linewidth',1.5);