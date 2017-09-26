function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;

w = w0;
[loss0,gradient] = func(w);
i = 0;

while norm(gradient) >= tolerance && i < maxiter
    i = i + 1;
    [loss,gradient] = func(w);
    w = w - stepsize * gradient;

    if loss < loss0
        stepsize = stepsize * 1.01;
    else
        stepsize = stepsize * 0.5;
    end    
    loss0 = loss;
end


