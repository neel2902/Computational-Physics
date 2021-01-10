N=3; M=100000;
R=1;
volCuboid=(2*R)^N;

count=0;
for p=1:M
    x = -R + 2*R*rand(1,N);
    s=sum(x.^2);
    if(s<=R^2)
        count=count+1;
    end
end

volSphere=(count/M)*volCuboid;
disp(volSphere);
disp(pi^(N/2)*R^N/gamma(N/2+1));
