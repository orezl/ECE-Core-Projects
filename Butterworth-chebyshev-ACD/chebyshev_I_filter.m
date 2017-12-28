clc;clear all;close all;
ap=input('passband attenuation');
as=input('stopband attenuation');
op=input('passband frequency');
os=input('stopband frequency');
lem=sqrt(10^(0.1*as)-1);
eps=sqrt(10^(0.1*ap)-1);
n=ceil(acosh(lem/eps)/acosh(os/op));
disp('order of chebyshev I filter is :');disp(n);
oc=op/(eps^(1/n));
phi(1,n)=0;
for i=1:n
    phi(i)=(pi/2)+(2*i-1)*pi/(2*n);
end
u=eps^(-1)+sqrt(1+(eps^(-2)));
b=op*(u^(1/n)+u^((-1)/n))*0.5;
a=op*(u^(1/n)-u^((-1)/n))*0.5;
s(1,n)=0;
digits(4);
for i=1:n
    s(i)=vpa(a*cos(phi(i)),3)+vpa(b*sin(phi(i)),3)*j;
end
syms x
h=1;
for i=1:n
    disp('phase angle');disp(phi(i));
    disp('s=');disp(s(i));
     h=1/(x-vpa(s(i),5))*h;
end
% syms x
% h=1;

% for i=1:n
    
%     h=1/(x-double(s(i)))*h;
% end
disp('transfer function is');%vpa(h,5);
disp(h);