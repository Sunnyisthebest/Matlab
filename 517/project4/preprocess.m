function [xTr,xTe,u,m]=preprocess(xTr,xTe);
% function [xTr,xTe,u,m]=preprocess(xTr,xTe);
%
% Preproces the data to make the training features have zero-mean and
% standard-deviation 1
%
% output:
% xTr - pre-processed training data 
% xTe - pre-processed testing data
% 
% u,m - any other data should be pre-processed by x-> u*(x-m)
%

% % 
%central data
NTr = size(xTr,1);
NTe = size(xTe,1);
xMean=mean(xTr,2);
xTr=xTr-repmat(xMean, 1, size(xTr,2));
xTe=xTe-repmat(xMean, 1, size(xTe,2));
m=0;
%compute derivation
u=diag(1./std(xTr'));
xTr=u*xTr;
xTe=u*xTe;













