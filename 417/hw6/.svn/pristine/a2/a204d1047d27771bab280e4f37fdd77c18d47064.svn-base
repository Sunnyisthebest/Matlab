function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here

[~,m]= size(xTe);
num = size(BDT,2);

predictions = zeros(num,m);

for i = 1:num
   predictions(i,:) = evaltree(BDT{i},xTe);
end

% Sinces trees are diverse both in data sampled and features split on
% simply taking the mode is a good indication of the best prediction
preds = mode(predictions,1);