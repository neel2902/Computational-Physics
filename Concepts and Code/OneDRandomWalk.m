% N steps, M walkers
N=1000; M=20000;
x=zeros(1,M);
p=0.6; q=1-p;

for m=1:M
    s=0;
    for n=1:N
        r = rand;
        if(r<=p)
            s=s+1;
        else
            s=s-1;
        end
    end
    x(m)=s;
end

xmin = min(x);
xmax = max(x);

% P=number of bins
P=100;
h=(xmax-xmin)/P;
bin=zeros(1,P);
y=xmin+h/2:h:xmax-h/2;


for m=1:M
    k=fix((x(m)-xmin)/h)+1;
    if k==P+1
        k=k-1;
    end
    bin(k)=bin(k)+1;
end

bin=bin/(M*h);


plot(y,bin,'*')
hold on
z=xmin:1:xmax;
zbar=N*(p-q);
PN=exp(-(z-zbar).^2/(8*N*p*q)/sqrt(8*pi*N*p*q));
plot(z, PN, 'r', 'linewidth', 1.5);
xlim([xmin xmax]); 
hold off


