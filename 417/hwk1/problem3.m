v1 = zeros();
v2 = zeros();

for i = 1 : 100
    eps = 0+i*0.005;
    v1(i) = randi([0,1], 6, 1);
    v2( = randi([0,1], 6,1)
    P1(i) = length(find(abs(v1(i)-0.5)>eps))/6;
    P2(i) = length(find(abs(v2(i)-0.5)>eps))/6;
    P=P1+P2-P1*P2;
    
end

plot(eps,P);
hold on;

x = 0.01:0.01:1.00;

H=4*exp(-12*x.^2);

     
  