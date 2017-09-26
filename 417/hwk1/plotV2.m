function[A,B] = plotV2(V1,V2)
A=zeros(1,100);
B=zeros(1,100);
P=zeros(1,100);
for i=1:1000;
    s=0+i*0.005;
    A(i)=length(find(abs(V1-0.5)>s))/100;
    B(i)=length(find(abs(V2-0.5)>s))/100;
    P(i)=A(i)+B(i)-A(i)*B(i)
    
end
c=0.001:0.001:1;
H=4*exp(-12*c.^2);
plot(c,P,c,H);
