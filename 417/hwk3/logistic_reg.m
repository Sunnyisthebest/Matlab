function [ w, e_in, t ] = logistic_reg( X, y, w_init, max_its, eta )
%LOGISTIC_REG Learn logistic regression model using gradient descent
%   Inputs:
%       X : data matrix (without an initial column of 1s)
%       y : data labels (plus or minus 1)
%       w_init: initial value of the w vector (d+1 dimensional)
%       max_its: maximum number of iterations to run for
%       eta: learning rate
    
%   Outputs:
%       w : weight vector
%       e_in : in-sample error (as defined in LFD)

[N,d] = size(X);
d = d+1;

x0 = ones(N,1);
X = [x0, X];

w_t = w_init;
gt = ones(1,d);
t = 0;
 %compute the gradient
while( (t<max_its) && (max(abs(gt))>10^-6)  )
    expx = exp(y'.*(w_t'*X'))
    gt=X'*(y'./(1+expx))'/(-N);
    %update the weight
    w_t = w_t - eta*gt;
    
    t = t+1;
end

w = w_t;

%compute Ein
Ein_sum = 0;
for n = 1:N
         Ein_sum = Ein_sum + log(1+exp(-y(n)*w'*(X(n,:)')));
end
e_in = 1/N*Ein_sum;

end

