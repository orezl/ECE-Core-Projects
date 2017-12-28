function [ btomc, btle, btep, btN, btTF ] = btf( oms,omp,ats,atp )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
btle=sqrt(10^(0.1*ats)-1);
btep=sqrt(10^(0.1*atp)-1);
btN=ceil(log(btle/btep)/log(oms/omp));
disp('order of butterworth filter is :');disp(btN);
disp('lemda of butterworth filter is :');disp(btle);
disp('epsilon of butterworth filter is :');disp(btep);
btomc=omp/(btep^(1/btN));
disp('cutt off frequency of butterworth filter is :');disp(btomc);
phi(1,btN)=0;
for i=1:btN
if mod(btN,2)==0
    phi(i)=(2*i-1)*pi/(2*btN);
else
    phi(i)=(pi/2)+(2*i-1)*pi/(2*btN);
end
end
s(1,btN)=0;
digits(4);
for i=1:btN
    s(i)=cos(phi(i))+sin(phi(i))*j;
end
for i=1:btN
    disp('phase angle');disp(phi(i));
    disp('s=');disp(s(i));
end
syms x
h=1;

for i=1:btN
    
    h=1/(x-vpa(s(i)))*h;
end
btTF=h;
disp('transfer function is');disp(h);%ezplot(char(h),[0,1000]);

end

