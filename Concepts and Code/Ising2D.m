%This program displays domain formation in the absence of magnetic field.
 
N=100; M=zeros(N,N);

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
 
M1=M;

 
J=1;           %positive J means ferromagnetism. Putting J=-1 will show
               %antiferromagnetic allignment of spins.
Q = 3000000;
T=2.26;           %At T=1, which is less than Tc, domains form. If T is g
               %greater than Tc, say, T=5, then no formation od domains.
 
 
for q=1:Q
    
    x=randi([1,N],1,2);
    m = x(1); n = x(2);
    
        if m == N
           mplus = 1;
        else
           mplus=m+1;
        end
    
        if n==N
            nplus=1;
        else
            nplus=n+1;
        end
    
        if m==1
            mminus=N;
        else
            mminus=m-1;
        end
    
        if n==1
            nminus=N;
        else
            nminus=n-1;
        end
    
    delE = 2*J*M(m,n)*(M(mplus,n)+ M(mminus,n)+ M(m,nplus)+ M(m,nminus));
    
    p=rand;
    
       if p < 1/(1+exp(delE/T))
          M(m,n)= -M(m,n);
       end
   
end
 
x=1:1:N;
y=1:1:N;
[X,Y]=meshgrid(x,y);
 
subplot(1,2,1)
mesh(X,Y,M1)
zlim([-100 100])

subplot(1,2,2)
mesh(X,Y,M)
zlim([-100 100])
 
 

% 