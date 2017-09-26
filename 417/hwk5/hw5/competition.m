function preds=competition(xTr,yTr,xTe);
% function preds=competition(xTr,yTr,xTe);
%
% A classifier that outputs predictions for the data set xTe based on 
% what it has learned from xTr,yTr
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

% The random classifier is awesome!!! Could you possibly do better?
% un=unique(yTr);
% [d,n]=size(xTe);
% preds=randi(length(un),1,n);

%fill in the code here

%using the cross-validation to select k
k   = 1;
res = 0;
[~, nTr] = size(xTr);
splitPoint = round(nTr * 0.8);
for ii = 1 : 20
    res_ii = analyze('acc',yTr(: , (splitPoint + 1) : end),...
               knnclassifier(...
                 xTr(: , 1 : splitPoint),...
                 yTr(: , 1 : splitPoint),...
                 xTr(: , (splitPoint + 1) : end),...
                 ii));
             
    if (res_ii > res)
        res = res_ii;
        k   = ii;
    end
end
% pred
fprintf('In competition, the k is %d\n', k);
preds = knnclassifier(xTr,yTr,xTe,k);
