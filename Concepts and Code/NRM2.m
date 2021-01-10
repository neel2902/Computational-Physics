% Newton Raphson Method for a system of Non Linear Equations

format short
f1=@(x,y)y-x^2;
f2=@(x,y)x^2+y^2-1;
f1x=@(x,y)-2*x; f1y=@(x,y)1;
f2x=@(x,y)2*x; f2y=@(x,y)2*y;
distance=@(x,y)sqrt((x-y)'*(x-y));

epsilon=1.0e-8;
x=[-1;10];
J=[f1x(x(1), x(2)), f1y(x(1),x(2));f2x(x(1),x(2)), f2y(x(1), x(2))];
y=x-J\[f1(x(1), x(2));f2(x(1), x(2))];
d=distance(x,y);

count=1;
while (d>=epsilon)
    x=y;
    J=[f1x(x(1), x(2)), f1y(x(1),x(2));f2x(x(1),x(2)), f2y(x(1), x(2))];
    y=x-J\[f1(x(1), x(2));f2(x(1), x(2))];
    count=count+1;
    if(count>1000)
        break;
    end
    d=distance(x,y);
end

f=[f1(y(1), y(2)), f2(y(1), y(2))];
disp(f);
disp(d);
disp(y);
disp(count);