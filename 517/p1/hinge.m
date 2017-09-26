function [loss,gradient]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[~,n]=size(xTr);

k= yTr .* (w' * xTr);
a = ones(1,n) -k;
absa = a + abs(a);
b=lambda * w' * w;
loss = sum(absa / 2) + b;

yTr(find(yTr .* (w' * xTr)) > 1) = 0;

gradient = -xTr * yTr' + 2 * w * lambda;




