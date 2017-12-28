function [ chomc, chle, chep, chN, chTF ] = chf( oms,omp,ats,atp )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
chle=sqrt(10^(0.1*ats)-1);
chep=sqrt(10^(0.1*atp)-1);
chN=ceil(acosh(chle/chep)/acosh(oms/omp));
disp('order of chebyshev I filter is :');disp(chN);
chomc=omp/(chep^(1/chN));
phi(1,chN)=0;
for i=1:chN
    phi(i)=(pi/2)+(2*i-1)*pi/(2*chN);
end
u=chep^(-1)+sqrt(1+(chep^(-2)));
b=omp*(u^(1/chN)+u^((-1)/chN))*0.5;
a=omp*(u^(1/chN)-u^((-1)/chN))*0.5;
s(1,chN)=0;
digits(4);
for i=1:chN
    s(i)=a*cos(phi(i))+b*sin(phi(i))*j;
end
for i=1:chN
    disp('phase angle');disp(phi(i));
    disp('s=');disp(s(i));
end
syms x
h=1;

for i=1:chN
    
    h=1/(x-vpa(s(i)))*h;
end
chTF=h;
disp('transfer function is');disp(h);


%ezplot(char(h),[0,10000]);
end

