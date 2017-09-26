function [preds]=linearmodel(w,xTv)
% function w=linearmodel(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTe dxn matrix (each column is an input vector)
%
% OUTPUTS:
% 
% preds predictions
% 

[d,n]=size(xTv);
preds = w'*xTv;


