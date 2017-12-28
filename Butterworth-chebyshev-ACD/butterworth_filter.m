clc;clear all;close all;
ap=input('passband attenuation');
as=input('stopband attenuation');
op=input('passband frequency');
os=input('stopband frequency');
lem=sqrt(10^(0.1*as)-1);
eps=sqrt(10^(0.1*ap)-1);
n=ceil(log(lem/eps)/log(os/op));
disp('order of butterworth filter is :');disp(n);
oc=op/(eps^(1/n));
disp('cutt off frequency of butterworth filter is :');disp(oc);
phi(1,n)=0;
digits(4);
for i=1:n
if mod(n,2)==0
    phi(i)=(2*i-1)*pi/(2*n);
else
    phi(i)=(pi/2)+(2*i-1)*pi/(2*n);
end
end
s(1,n)=0;
for i=1:n
    s(i)=cos(phi(i))+sin(phi(i))*j;
end
for i=1:n
    disp('phase angle');disp(phi(i));
    disp('s=');disp(s(i));
end
syms x
h=1;

for i=1:n
    
    h=1/(x-vpa(s(i)))*h;
end
disp('transfer function is');disp(h);