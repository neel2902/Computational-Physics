f=@(x) sin(x);
n=15;a=pi;
y=f(x);

function[y]=Lagrange(k,n,x,z)
    y=1;
    for p=1:n
        if(p~=k)
            y=y*(x-z(p));
        end
    end
end

