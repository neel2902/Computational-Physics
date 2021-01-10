sigma=1; mu=0;
% Normal function
f=@(x) exp(-(x-mu).^2/(2*sigma^2))/sqrt((2*pi)*sigma);
a=-4; b=4;
h=0.1; N=(b-a)/h+1;
x=a+h/2:h:b-h/2;

% y is our discretized cumulative distribution function
y=zeros(1,N);
y(1)=f(x(1));

for n=2:N
    y(n)=y(n-1)+h*f(x(n-1)); 
end


M=1000; bin=zeros(1,N-1);

for k=1:M
   z=rand;
%    binary search is a better algo here for greater and lower bound but
%    just use a direct loop here...
    for m=1:N-1
        if(y(m+1)>=z && y(m)<=z)
            bin(m)=bin(m)+1;
            break;
        end
    end
end

PDF=bin/(M*h);
plot(x,PDF,'o')
hold on
plot(x, f(x), 'r', 'linewidth', 1.5);
hold off


