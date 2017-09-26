function[v1,v2]=flipcoin2(n);
V1=zeros(n,1);
V2=zeros(n,1);
for i=1:n
    A=mean(round(rand(2,6)),2);
    v1=A(1);
    v2=A(2);
    V1(i)=v1;
    V2(i)=v2;
end
plotV2(V1,V2)
