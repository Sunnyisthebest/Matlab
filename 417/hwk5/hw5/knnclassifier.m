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

[l,w]=size(xTe);

lengthtd=l;
[indices, ~]=findknn(xTr,xTe,k);
if ( k == 1 )
    preds = yTr(indices);
elseif (k == 2)
    preds = yTr(indices(1,:));
else
    [m,~,C] = mode(yTr(indices));
    [~, n]  = size(m);
    %check wheter there is a tie happens
    cellLenthsm = cellfun(@length,C);
    
    if (~all(cellLenthsm == ones(1, n)))%if there is not, we can continue
        %if there is
        drawflag = (cellLenthsm ~= ones(1, n));
        drawi = find(drawflag == 1);
        label = mode(yTr(indices(1:k-1, :)));
        m(drawi) = label(drawi);
    end
        
%         
%         [label,~,Cs] = mode(yTr(indices(1:k-1, :)));
%         celllengthscs= cellfun(@length,Cs);
% %         if (~all(cellLenthsm == ones(1, n)))%if there is not, we can continue
% %                 %if there is
% %                 drawflag2 = (cellLenthsm ~= ones(1, n));
% %                 drawi = find(drawflag2 == 1);
% %         end
%         m(drawi) = label(drawi);
%     end
%     shrehold=l*0.1;
%     while(all(cellLenthsm == ones(1, n))|| lengthtd<= shrehold||k==1)
%         drawflag = (cellLenthsm ~= ones(1, n));
%         drawi = find(drawflag == 1);
%         [~,lengthtd]=size(drawi);
%         [label,~,Cs] = mode(yTr(indices(1:k-1, :)));
%         cellLenthsm= cellfun(@length,Cs);
%     end
    preds = m;
    
end

