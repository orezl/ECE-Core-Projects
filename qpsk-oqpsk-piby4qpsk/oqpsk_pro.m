clc;close all;clear all;
a=input('enter seqence','s'); 
%  input is provided with each digit with spacing
%a1=a;
a=str2num(a);
cf=input('carier frequency');
ca=input('carrier amplitude');
cp=input('carrier initial phase');
n=length(a);
disp(n);
v=0;j=1;

tb=1;  % bit rate

if mod(n,2) ~=0
    a(n+1)=0;
end
n=length(a);
disp(n);
t1= 0: 0.01 : n-0.01;
j=1;y=[zeros(1,length(t1))];
for i=1:length(t1)
    if j==n+1
        break;
    end
    if t1(i)<j
        y(i)=a(j);
    else
        j=j+1;
    end
end
plot(t1,y);axis([0 n+1 -3 4]);

t1= 0: 0.01 : n-0.01;
j=1;y=[zeros(1,length(t1))];
I1=[zeros(1,(n/2))];Q1=[zeros(1,(n/2))];
i1=1;i2=1;
for i=1:length(t1)
    if j==n+1
        break;
    end
    if t1(i)<j
        y(i)=a(j);
    else
        j=j+1;
    end
end
bz=a;
for i=1:length(a)
    if a(i)==0
        a(i)=-1;
        
    end
end

for i=1:length(a)
    if mod(i,2)==0
        Q1(i2)=a(i);
        i2=i2+1;
    else
        I1(i1)=a(i);
        i1=i1+1;
    end
end

Q((n*100/2)+50)=0;I((n*100/2)+50)=0;t1=0:.01:(n/2)-.01+.5;
n1=length(Q1);j=1;
for i=1:length(t1)
    if j==n1+1
        break;
    end
    if t1(i)<j
        Q(i)=Q1(j);
    else
        j=j+1;
    end
end

n1=length(Q1);j=1;
for i=1:length(t1)
    if j==n1+1
        break;
    end
    if t1(i)<j
        I(i)=I1(j);
    else
        j=j+1;
    end
end




%  Q=shiftdim(Q,50);
    i=length(Q);
    while i>50
        Q(i)=Q(i-50);
        i=i-1;
    end
    for i=1:50
        Q(i)=0;
    end
s=ca*cos(cf*2*pi*t1 +cp)*sqrt(2);    
figure;
plot(t1,s);
hold on    
    
for i=1:length(t1)
s(i)=ca*cos(cf*2*pi*t1(i) +cp)*I(i)-Q(i)*ca*sin(cf*2*pi*(t1(i)) +cp);
end
plot(t1,s,'--g');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ir=[zeros(1,n/2)];
ir(1)=ceil(s(25)/(ca*cos(cf*2*pi*t1(25) +cp)));
qr(n/2)=ceil(-s((n*100/2)+25)/(ca*sin(cf*2*pi*t1((n*100/2)+25) +cp)));

flag=ir(1);i=0;
for j=1:n/2
    if j<n/2
        k=((2*i+1)*50)+45;
    qr(j)=ceil(-(s(k)-ca*cos(cf*2*pi*t1(k) +cp)*ir(j))/(ca*sin(cf*2*pi*t1(k) +cp)));
     if qr(j)>1
        qr(j)=qr(j)-1;
     end
    if qr(j)<-1
        qr(j)=qr(j)+1;
    end
    end
i=i+1;


if j<(n/2)
    k=((2*(j))*50)+45;
    ir(j+1)=ceil((s(k)+ca*sin(cf*2*pi*t1(k) +cp)*qr(j))/(ca*cos(cf*2*pi*t1(k) +cp)));
    if ir(j+1)>1
        ir(j+1)=ir(j+1)-1;
    end
    if ir(j)<-1
        ir(j)=ir(j)+1;
    end
    
    
end

end
z=[zeros(1,n)];
j1=1;j2=1;
for i=1:n
   if mod(i,2)==0
    if qr(j1)<=0
        z(i)=0;
    else
        z(i)=1;
    end
    j1=j1+1;else
     if ir(j2)>0
        z(i)=1;
    else
        z(i)=0;
    end
    j2=j2+1;
   end
end
disp(bz);
disp(z);

rb=1/tb;
%input('bit rate');  
%  tb=1
no=input('noise psd');
eb=((ca^2)/2)*tb;
disp(eb);
ber=erfc(sqrt(eb/(no*2)));
disp('bit error rate in awgn channel is');disp(ber);
ber=1-(sqrt((eb/no)/(1+(eb/no))));
disp('bit error rate in releigh fading channel is');disp(ber);

    