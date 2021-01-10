% Newton Raphson Method for a system of Non Linear Equations (3 variables)

format short
f1=@(x,y,z)x^2+y^2+z^2-1;
f2=@(x,y,z)x^2+y^2-z;
f3=@(x,y,z)x+y+z;
f1x=@(x,y,z)2*x; f1y=@(x,y,z)2*y; f1z=@(x,y,z)2*z;
f2x=@(x,y,z)2*x; f2y=@(x,y,z)2*y; f2z=@(x,y,z)-1;
f3x=@(x,y,z)1; f3y=@(x,y,z)1; f3z=@(x,y,z)1;

distance=@(x,y)sqrt((x-y)'*(x-y));
epsilon=1.0e-8;

x=[-1;2;1];
J=[f1x(x(1),x(2),x(3)), f1y(x(1),x(2),x(3)), f1z(x(1),x(2),x(3));...
   f2x(x(1),x(2),x(3)), f2y(x(1),x(2),x(3)), f2z(x(1),x(2),x(3));...
   f3x(x(1),x(2),x(3)), f3y(x(1),x(2),x(3)), f3z(x(1),x(2),x(3));];
y=x-J\[f1(x(1),x(2),x(3));f2(x(1),x(2),x(3));f3(x(1),x(2),x(3))];
d=distance(x,y);

count=1;
while (d>=epsilon)
    x=y;
    J=[f1x(x(1),x(2),x(3)), f1y(x(1),x(2),x(3)), f1z(x(1),x(2),x(3));...
    f2x(x(1),x(2),x(3)), f2y(x(1),x(2),x(3)), f2z(x(1),x(2),x(3));...
    f3x(x(1),x(2),x(3)), f3y(x(1),x(2),x(3)), f3z(x(1),x(2),x(3));];
    y=x-J\[f1(x(1),x(2),x(3));f2(x(1),x(2),x(3));f3(x(1),x(2),x(3))];
    d=distance(x,y);
    count=count+1;
    if(count>1000)
        break;
    end
end

f=[f1(y(1),y(2),y(3)), f2(y(1),y(2),y(3)), f3(y(1),y(2),y(3))];
disp(f);
disp(d);
disp(y);
disp(count);