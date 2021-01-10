format long;

% using while loop and initial and final variables
epsilon=1.0e-3;
x=1.40;
y=x-(x^3-x-1)/(3*(x^2)-1);
count=1;
while abs(y-x)>=epsilon
    x=y;
    y=x-(x^3-x-1)/(3*(x^2)-1);
    count=count+1;
end
disp(y);
disp(y-cos(y));
disp(count);



%using for loop and an array to store
