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

tb=1; % bit rate

if mod(n,2) ~=0
    a(n+1)=0;
end

n=length(a);
disp(n);
t1= 0: 0.01 : n-0.01;
j=1;y=[zeros(1,length(t1))];
s=sqrt(2)*ca*cos(cf*2*pi*t1 +cp);
s1=s;



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
figure
plot(t1,s);
hold on

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    

for i=1:length(a)
    if mod(i,2)==0
         t2=num2str(a(i));t3=num2str(a(i-1));
         t=[t3,t2];
        switch t 
            case '00'
                v(i)=4;v(i-1)=4;
               
                
            case '01'
                v(i)=1;v(i-1)=1;
               
            case '10'
                v(i)=2;v(i-1)=2;
               
            case '11'
                v(i)=3;v(i-1)=3;
               
        end
    end
end


j=1;q=0;
y1=[zeros(1,length(t1))];
for i=1:length(t1)
    if j==n+1
        break;
    end
     if mod(i,100)==1
         y1(i)=v(j+1);q=i;
    end
    if t1(i)<j
        y1(i)=v(j);
    else
        j=j+1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(t1)
      switch y1(i)
            case 4
                s(i)=sqrt(2)*ca*cos(cf*2*pi*t1(i)+cp+(3*pi/4));
                
            case 1
                s(i)=sqrt(2)*ca*cos(cf*2*pi*t1(i)+cp+((-3*pi)/4));
                
            case 2
                s(i)=sqrt(2)*ca*cos(cf*2*pi*t1(i)+cp+((pi)/4));
            case 3
                s(i)=sqrt(2)*ca*cos(cf*2*pi*t1(i)+cp+((-pi)/4));
        end
end
plot(t1,s,'--g');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d=s;dem=[ones(1,n)];f='flag';j=1;
digits(3);
for i=1:length(t1)
    if mod(i,199)==0
        temp1=s(i)/(sqrt(2)*ca);disp(temp1);
        temp2=s1(i)/(sqrt(2)*ca);disp(temp2);
        ph1=acos(temp1);disp(ph1);
        ph2=acos(temp2);disp(ph2);
        dif=(ph1-ph2);
        disp(dif);disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
        switch vpa(temp1)
            case vpa(cos(cf*2*pi*t1(i)+cp+(3*pi/4)))
                dem(j+1)=0;dem(j)=0;
                j=j+2;
            case cos(cf*2*pi*t1(i)+cp+((-3*pi)/4))
                dem(j+1)=1;dem(j)=0;
                j=j+2;
            case cos(cf*2*pi*t1(i)+cp+((pi)/4))
                dem(j+1)=0;dem(j)=1;
                j=j+2;
            case cos(cf*2*pi*t1(i)+cp+((-pi)/4))
                dem(j+1)=1;dem(j)=1;
                j=j+2;
        end
        if j==n+1
        break;
    end
        
    end
    
end
disp(a);
disp(dem);

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
