function [loss,gradient]=logistic(w,xTr,yTr)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
% loss caluculation
loss = 0;
for i = 1:n
    loss = loss + log(1 + exp(-yTr(i)*w'*xTr(:,i)));
end

% gradient calculation
gradient = zeros(d,1);
for i = 1:n
    gradient = gradient - (yTr(i)*xTr(:,i))./(1+exp(yTr(i)*w'*xTr(:,i)));
end
