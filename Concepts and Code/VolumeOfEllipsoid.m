% Volume of an N dimensional ellipsoid
format short;
N=3; M=1000000;


range=[1 3 5];
count=0;
volOfDomain=prod(2*range);

for p=1:M
    X=-range + 2*range.*rand(1,N);
    s=sum((X./range).^2);
    if(s<=1)
        count=count+1;
    end
end

% Calculate volume of ellipsoid
volEllipsoid=volOfDomain*(count/M);
disp(volEllipsoid);
disp(4/3*pi*prod(range));