function[x,y1,y2]=RK2(N,x0,xn,y10,y20,f1,f2)
h=(xn-x0)/(N-1);
x=zeros(1,N); y1=zeros(1,N); y2=zeros(1,N);
x(1)=x0; y1(1)=y10; y2(1)=y20;

for i=2:N
    k11=f1(x(i-1), y1(i-1), y2(i-1));
    k21=f2(x(i-1), y1(i-1), y2(i-1));
    
    k12=f1(x(i-1)+h, y1(i-1)+h*k11, y2(i-1)+h*k21);
    k22=f2(x(i-1)+h, y1(i-1)+h*k11, y2(i-1)+h*k21);
    
    y1(i)=y1(i-1)+h*(k11+k12)/2;
    y2(i)=y2(i-1)+h*(k21+k22)/2;
    
    x(i)=x(i-1)+h;
end

end
