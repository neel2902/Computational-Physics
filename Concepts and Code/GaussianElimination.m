prompt='Input the augmented matrix A : ';
A=input(prompt);
m=size(A);
disp(m);
N=m(1);


% Getting the echelon form
for k=1:N-1
    if A(k,k)==0
        for j=k+1:N
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
    
    for i=k+1:N
         A(i,:)=A(i,:)-A(i,k)/A(k,k)*A(k,:);
    end
   
end
 
 
for k=1:N
    
    if A(k,k:N)==0 & A(k,N+1)~=0
        disp('System Inconsistent')
        return
    end
    
    if A(k,k:N+1)==0
       disp('The system has infinitely many solutions')
       return
    end
    
end
 
% Back Substitution
    
x=zeros(1,N);
 
x(N)=A(N,N+1)/A(N,N);
for k=N-1:-1:1
    sum=0;
    
    for j=k+1:N
        sum=sum+A(k,j)*x(j);
    end
    
    x(k)=1/A(k,k)*(A(k,N+1)-sum);
end
 
disp(x)
