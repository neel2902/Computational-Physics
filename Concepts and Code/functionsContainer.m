classdef functionsContainer
    methods(Static)
        function x = Thomas_Algo(a,b,c,d,n)
        p=zeros(1,n);
        q=zeros(1,n);
        p(1)=-c(1)/b(1) ; q(1)=d(1)/b(1);
        x=zeros(1,n+1);
            for k=2:n
             denom = b(k)+ a(k)*p(k-1);
             p(k)=-c(k)/denom;
             q(k)=(d(k)-a(k)*q(k-1))/denom;

            end
            for k = n:-1:1
             x(k)= p(k)*x(k+1)+q(k);
            end
        end
    end
end