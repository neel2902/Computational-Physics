% RK4_4equations
function[x,y1,y2,y3,y4]=RK4(N,x0,xn,y10,y20,y30,y40,f1,f2,f3,f4)
h=(xn-x0)/(N-1);
x=zeros(1,N); y1=zeros(1,N); y2=zeros(1,N); y3=zeros(1,N); y4=zeros(1,N);
x(1)=x0; y1(1)=y10; y2(1)=y20; y3(1)=y30; y4(1)=y40;

for i=2:N
    k11=f1(x(i-1), y1(i-1), y2(i-1),y3(i-1),y4(i-1));
    k21=f2(x(i-1), y1(i-1), y2(i-1),y3(i-1),y4(i-1));
    k31=f3(x(i-1), y1(i-1), y2(i-1),y3(i-1),y4(i-1));
    k41=f4(x(i-1), y1(i-1), y2(i-1),y3(i-1),y4(i-1));
    
    k12=f1(x(i-1)+h/2, y1(i-1)+(h/2)*k11, y2(i-1)+(h/2)*k21, y3(i-1)+(h/2)*k31, y4(i-1)+(h/2)*k41);
    k22=f2(x(i-1)+h/2, y1(i-1)+(h/2)*k11, y2(i-1)+(h/2)*k21, y3(i-1)+(h/2)*k31, y4(i-1)+(h/2)*k41);
    k32=f3(x(i-1)+h/2, y1(i-1)+(h/2)*k11, y2(i-1)+(h/2)*k21, y3(i-1)+(h/2)*k31, y4(i-1)+(h/2)*k41);
    k42=f4(x(i-1)+h/2, y1(i-1)+(h/2)*k11, y2(i-1)+(h/2)*k21, y3(i-1)+(h/2)*k31, y4(i-1)+(h/2)*k41);
    
    k13=f1(x(i-1)+h/2, y1(i-1)+(h/2)*k12, y2(i-1)+(h/2)*k22, y3(i-1)+(h/2)*k32, y4(i-1)+(h/2)*k42);
    k23=f2(x(i-1)+h/2, y1(i-1)+(h/2)*k12, y2(i-1)+(h/2)*k22, y3(i-1)+(h/2)*k32, y4(i-1)+(h/2)*k42);
    k33=f3(x(i-1)+h/2, y1(i-1)+(h/2)*k12, y2(i-1)+(h/2)*k22, y3(i-1)+(h/2)*k32, y4(i-1)+(h/2)*k42);
    k43=f4(x(i-1)+h/2, y1(i-1)+(h/2)*k12, y2(i-1)+(h/2)*k22, y3(i-1)+(h/2)*k32, y4(i-1)+(h/2)*k42);
    
    k14=f1(x(i-1)+h, y1(i-1)+(h)*k13, y2(i-1)+(h)*k23, y3(i-1)+(h)*k33, y4(i-1)+(h)*k43);
    k24=f2(x(i-1)+h, y1(i-1)+(h)*k13, y2(i-1)+(h)*k23, y3(i-1)+(h)*k33, y4(i-1)+(h)*k43);
    k34=f3(x(i-1)+h, y1(i-1)+(h)*k13, y2(i-1)+(h)*k23, y3(i-1)+(h)*k33, y4(i-1)+(h)*k43);
    k44=f4(x(i-1)+h, y1(i-1)+(h)*k13, y2(i-1)+(h)*k23, y3(i-1)+(h)*k33, y4(i-1)+(h)*k43);
    
    
    y1(i)=y1(i-1)+h*(k11+2*k12+2*k13+k14)/6;
    y2(i)=y2(i-1)+h*(k21+2*k22+2*k23+k24)/6;
    y3(i)=y3(i-1)+h*(k31+2*k32+2*k33+k34)/6;
    y4(i)=y4(i-1)+h*(k41+2*k42+2*k43+k44)/6;
    
    x(i)=x(i-1)+h;
end

end