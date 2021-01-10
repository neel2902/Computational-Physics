function [x, y1, y2]=EulerDiff(N,x0,xn,y10,y20,f1,f2)
h=(xn-x0)/(N-1);
x=zeros(1,N); y1=zeros(1,N); y2=zeros(1,N);
x(1)=x0; y1(1)=y10; y2(1)=y20;

for i=2:N
    y1(i)=y1(i-1)+h*f1(x(i-1),y1(i-1),y2(i-1));
    y2(i)=y2(i-1)+h*f2(x(i-1),y1(i-1),y2(i-1));
    x(i)=x(i-1)+h;
end

end

