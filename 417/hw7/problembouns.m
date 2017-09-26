n=5000;
p=zeros(n,n);

p(1,1)=1;

e=zeros(n);
for i=2:n
    p(1,i)=(1/n)^(i-1);
end
for i=2:n
    for j=2:n
        p(i,j)=p(i,j-1)*(i/n)+p(i-1,j-1)*((n-(i-1))/n);
    end 
end
nn =[1:n]';
tmp = zeros(5000,1);
for k=1:5000
    e = zeros(k,1);
    for i=1:k
        e(i)=sum(p(:,k).*(nn/k));
    end
        tmp(k) = e(end);
end

plot(tmp);
