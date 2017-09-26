function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)


%currently assigning random predictions
%un=unique(yTr);
%preds=un(ceil(rand(1,n)*length(un)));

%% fill in code here
[indices, ~]=findknn(xTr,xTe,k);
if ( k == 1 )
    preds = yTr(indices);
elseif (k == 2)
    preds = yTr(indices(1,:));
else
    [M,~,C] = mode(yTr(indices));
    [~, n]  = size(M);
    cellLenths = cellfun(@length,C);
    
    if (~all(cellLenths == ones(1, n)))
        needDraw      = (cellLenths ~= ones(1, n));
        needDrawIndex = find(needDraw == 1);
        M_less = mode(yTr(indices(1:k-1, :)));
        M(needDrawIndex) = M_less(needDrawIndex);
    end
    
    preds = M;
    
end

