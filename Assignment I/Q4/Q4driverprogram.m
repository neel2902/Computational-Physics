a=-5;
b=5;
n=8;
f=@(x) 37*x.^5+4*x.^4+0.5*x.^3+7*x;
x=linspace(a,b,n);

% Adding noise with 10% bar
noise=(randi(20,1,n)-10).*f(x)/100;
y=f(x)+noise;

LegendrePolyCurveFitting(x,y,a,b,200);