% Torus, sphere and plane equations, respectively

a=1;
b=3;
% Mean radius of torus
R_torus=(b+a)/2;
% Radius of tube
r_torus=(b-a)/2;
% Radius of sphere between a and b;
r_sphere=2;


f1=@(x,y,z) (sqrt(x^2+y^2)-R_torus)^2+z^2-r_torus^2;
f2=@(x,y,z) (x^2+y^2+z^2-r_sphere^2);
f3=@(x,y,z) (2*x-3*y+z);

f1x=@(x,y,z) 2*x*(1-R_torus*(sqrt(x^2+y^2)^(-1)));
f1y=@(x,y,z) 2*y*(1-R_torus*(sqrt(x^2+y^2)^(-1)));
f1z=@(x,y,z) 2*z;

f2x=@(x,y,z) 2*x;
f2y=@(x,y,z) 2*y;
f2z=@(x,y,z) 2*z;

f3x=@(x,y,z) 2;
f3y=@(x,y,z) -3;
f3z=@(x,y,z) 1;

distance=@(x,y)sqrt((x-y)'*(x-y));
% Initial guesses
disp("Initial guesses");
x=[0.1;1.5;0.5];
disp(x);
epsilon=1.0e-8;

% Constructing the Jacobian
J=[f1x(x(1),x(2),x(3)), f1y(x(1),x(2),x(3)), f1z(x(1),x(2),x(3));...
   f2x(x(1),x(2),x(3)), f2y(x(1),x(2),x(3)), f2z(x(1),x(2),x(3));...
   f3x(x(1),x(2),x(3)), f3y(x(1),x(2),x(3)), f3z(x(1),x(2),x(3))];

y=x-J\[f1(x(1),x(2),x(3));f2(x(1),x(2),x(3));f3(x(1),x(2),x(3))];
d=distance(x,y);

% 3D-Newton Raphson Method
count=1;
while (d>=epsilon)
    x=y;
    J=[f1x(x(1),x(2),x(3)), f1y(x(1),x(2),x(3)), f1z(x(1),x(2),x(3));...
       f2x(x(1),x(2),x(3)), f2y(x(1),x(2),x(3)), f2z(x(1),x(2),x(3));...
       f3x(x(1),x(2),x(3)), f3y(x(1),x(2),x(3)), f3z(x(1),x(2),x(3))];
    y=x-J\[f1(x(1),x(2),x(3));f2(x(1),x(2),x(3));f3(x(1),x(2),x(3))];
    d=distance(x,y);
    count=count+1;
    if(count>1000)
        break;
    end
end

disp("Point of intersection: ");
disp(y);
disp("Count: "+count);
   