format short;

% Generating random array by using the same algorithm
A = zeros(1,100);
% a and c random seeds from lying within 1000, can be taken as user inputs
% also
a=input("Enter random seed a between 0 to 1000: ");
b=input("Enter random seed b between 0 to 1000: ");

m=1001;
A(1)=mod(c,m);
n=length(A);
% Range from 0 to 1000;
for i=2:n
    A(i)=mod((a*A(i-1)+c),m);
end
A = bubbleSort(A);
sum=0;
for i=1:n
    sum=sum+A(i);
end
Mean=sum/n;

n_variance=0;
for i=1:n
    n_variance=(A(i)-Mean)^2 + n_variance;
end

Variance=n_variance/n;
Standard_Deviation=sqrt(Variance);

if (mod(n,2)==0)
    Median=(A(n/2)+A(n/2 + 1))/2;
else
    Median=A((n+1)/2);
end

Smallest=A(1);
Largest=A(n);

%Results
disp("Smallest: "+Smallest);
disp("Largest: "+Largest);
disp("Median: "+Median);
disp("Mean: "+Mean);
disp("Variance: "+Variance);
disp("Standard Deviation: "+Standard_Deviation);

% Simple bubble sort with loop break optimisation if array is sorted at any
% point
function[X]=bubbleSort(X)
    size=length(X);
    for i=1:size
        %     boolean swapped variable to check if there was any sqap, if
        %     no swap then it means array is already sorted and we break
        %     out of the loop
        swapped=0;
        for j=1:size-i
            if(X(j)>X(j+1))
                temp=X(j);
                X(j)=X(j+1);
                X(j+1)=temp;
                
                swapped=1;
            end
        end
        if(swapped==0)
            break;
        end
    end
end
