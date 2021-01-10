RandArr = zeros(1,500);
% a and c random seeds from lying within 2000
disp("Some seeds might not produce best results, please try again with different seeds if so");
a=739;
c=1934;
m=2001;
RandArr(1)=mod(c,m);

n=500;
% Range from 0 to 2000;
for i=2:n
    RandArr(i)=mod((a*RandArr(i-1)+c),m);
end

% Range from -1000 to 1000 achieved by adding -1000 to each term
for i=1:n
    RandArr(i)=RandArr(i)-1000;
end

sum=0;
for i=1:n
    sum=sum+RandArr(i);
end
Mean=sum/n;

n_variance=0;
for i=1:n
    n_variance=(RandArr(i)-Mean)^2 + n_variance;
end

Variance=n_variance/n;
Standard_Deviation=sqrt(Variance);

disp("Mean: "+Mean);
disp("Variance: "+Variance);
disp("Standard Deviation: "+Standard_Deviation);

histogram(RandArr,100);