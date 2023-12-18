function [A0,An,Bn]=FseriesFunc(Num,P,a,Nshow,draw)
T = 2.*pi;
f = @(t) t.^(a);
fan = @(t) t.^(a)*cos((1:Num)*t);
fbn = @(t) t.^(a)*sin((1:Num)*t);
an = (2/T)*integral(fan,-T./2,T./2,'ArrayValued',true);
bn = (2/T)*integral(fbn,-T./2,T./2,'ArrayValued',true);
a0 = (1/T)*integral(f,-T./2,T./2);

t = linspace(-T./2,(-T./2)+P.*T);
x = a0;

A0=a0;
An=zeros(Nshow,1);
Bn=zeros(Nshow,1);

for i = 1:Nshow
An(i)=an(i);
Bn(i)=bn(i);
end

for n = 1:Num
x = x + an(n)*cos(n*t) + bn(n)*sin(n*t);
end

if draw==1
plot(t,x);
xlabel("Horizontal axis")
ylabel("Vertical axis")
end
end