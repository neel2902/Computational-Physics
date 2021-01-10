% N is the number of points to be generated. M is the number of bins.
% h is the step size of the bins.
N=1000; M=51;
h=1/(M-1);
% this holds the midpoints of the bins, we will use it to for the x-axis.
x=(h/2:h:1-h/2); 
bin = zeros(1,M-1);
e = exp(1);

for i=1:N
    s=1-log(e-(e-1)*rand);
    k=fix(s/h)+1;
    bin(k)=bin(k)+1;
end

bin=bin/(h*N);

plot(x,bin,'*');
hold on
plot(x,e*exp(-x)/(e-1),'r','linewidth', 1.5);
hold off

