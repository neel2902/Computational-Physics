% This program demonstrates phase transition in a 2D Ising lattice with an
% external magnetic field. Alpha is the parameter that defines the strength
% of the magnetic field in comparison with spin-spin interaction strength.
 
N=100;                  % Lattice is NxN
M=zeros(N,N);
for m=1:N
    
    for n=1:N
        
        x=rand;
        
        if x<=0.5
            M(m,n)= -1;
            
        else
            M(m,n)=1;
        end
        
    end
    
end
 
 
J=1;KB=1;
alpha=0.1;
J1=alpha*J;
Q=1000000;         %Q is the number of iteration for obtaining equilibrium.
P=30;
Mav=zeros(1,P);T=zeros(1,P);
 
for p=1:P
    T(p)=0.2*p;
 
for q=1:Q
    
    x=randi([1,N],1,2);
    m = x(1); n = x(2);
    
    if m==N
        mplus=1;
    else
        mplus=m+1;
    end
    
    if n==N
        nplus=1;
    else
        nplus=n+1;
    end
    
    if m == 1
        mminus = N;
    else
        mminus = m-1;
    end
    
    if n == 1
        nminus = N;
    else
        nminus = n-1;
    end
    
    delE = 2*(J/KB)*M(m,n)*(M(mplus,n)+ M(mminus,n)+ M(m,nplus)+ ...
          M(m,nminus))+ 2*(J1/KB)*M(m,n);
    
    r=rand;
    
    if r<1/(1+exp(delE/T(p)))
       M(m,n)=-M(m,n);
    end
    
end
 
Mav(p)=sum(sum(M))/N^2;
    
    
end
 
 
plot(T,Mav,'*')

xlim([0 8])
ylim([-1.2 1.2])
xlabel('Temperature')
ylabel('Magnetic Moment/Lattice site')
grid on

