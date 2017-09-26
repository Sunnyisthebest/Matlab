prob_vr=zeros(1,100);
for i=1:100
    eps = 0+i*0.005;
    upper_bound = 0.5 + eps;
    lower_bound = 0.5 - eps;
    upper_one = length(find(vr>upper_bound));
    lower_one = length(find(vr<lower_bound));
    prob_nu = (upper_one + lower_one) / length(vr);
    prob_vr(i) = prob_nu;
end
x1 = 0.005:0.005:0.5;
plot(x1,prob_vr);
H=2*exp(-20*x1.^2);
plot(x1,H,x1,prob_vr);
