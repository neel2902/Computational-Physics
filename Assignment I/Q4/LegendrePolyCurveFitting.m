function [z]=LegendrePolyCurveFitting(x,y,a,b,toBeGeneratedPoints)

% Original Legendre Polynomials
    p0=@(x) 1;
    p1=@(x) x;
    p2=@(x) (3*x.^2-1)/2;
    p3=@(x) (5*x.^3-3*x)/2;
    p4=@(x) (35*x.^4-30*x.^2+3)/8;
    p5=@(x) (63*x.^5-70*x.^3+15*x)/8;
    
%   Shifted Legendre Polynomials
    f0=@(x) p0((2*x-a-b)/(b-a));
    f1=@(x) p1((2*x-a-b)/(b-a));
    f2=@(x) p2((2*x-a-b)/(b-a));
    f3=@(x) p3((2*x-a-b)/(b-a));
    f4=@(x) p4((2*x-a-b)/(b-a));
    f5=@(x) p5((2*x-a-b)/(b-a));
    
    n=length(x);
    rows=6;
    A=zeros(rows,n);

%   Populating the matrix
    for k=1:n
        A(1,k)=f0(x(k));
        A(2,k)=f1(x(k));
        A(3,k)=f2(x(k));
        A(4,k)=f3(x(k));
        A(5,k)=f4(x(k));
        A(6,k)=f5(x(k));
    end
    
    B=A*A';
    rightHandSide=A*y';
    
    AugmentedMatrix=[B rightHandSide];
    dimensions=size(AugmentedMatrix);
    augRows=dimensions(1);
   
    A = AugmentedMatrix;
    
%   Gaussian Elimination Starts here
%   Getting the Echelon Form
    for k=1:augRows-1
        if A(k,k)==0
            for j=k+1:augRows
    %             swap first instance of row where the the diagonal element is
    %             not 0
                if A(j,k)~=0
                    y=A(j,:);
                    A(j,:)=A(k,:);
                    A(k,:)=y;
                    break
                end
            end
        end

        for i=k+1:augRows
             A(i,:)=A(i,:)-A(i,k)/A(k,k)*A(k,:);
        end
    end
%   Checks
    for k=1:augRows
        if A(k,k:augRows)==0 & A(k,augRows+1)~=0
            disp('System Inconsistent')
            return
        end
        if A(k,k:augRows+1)==0
           disp('The system has infinitely many solutions')
           return
        end
    end
%   Back Substitution
    coefficients=zeros(1,augRows);
    coefficients(augRows)=A(augRows,augRows+1)/A(augRows,augRows);
    for k=augRows-1:-1:1
        sum=0;
        for j=k+1:augRows
            sum=sum+A(k,j)*coefficients(j);
        end

        coefficients(k)=1/A(k,k)*(A(k,augRows+1)-sum);
    end
    
    t=linspace(a,b,toBeGeneratedPoints);
    z=coefficients(1)*f0(t)+coefficients(2)*f1(t)+coefficients(3)*f2(t)+coefficients(4)*f3(t)+coefficients(5)*f4(t)+coefficients(6)*f5(t);
    
    plot(x, y, '*')
    hold on
    plot(t,z,'g','linewidth', 1.0)
    hold off
    
    
end
