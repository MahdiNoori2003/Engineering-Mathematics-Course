function [a0,an,bn]=harmonic_analisys(x,fx,N)
n=length(x);
a0=sum(fx)/(n);
an=zeros(N,1);
bn=zeros(N,1);
for i=1:N
    for j=1:n
        an(i)=an(i)+fx(j).*cos(i.*x(j));
        bn(i)=bn(i)+fx(j).*sin(i.*x(j));
    end
    an(i)=(2.*an(i))./i;
    bn(i)=(2.*bn(i))./i;
end
y=a0;
t=x;
for k = 1:N
y = y + an(k)*cos(k*t) + bn(k)*sin(k*t);
end
plot(t,y);
end