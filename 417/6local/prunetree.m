function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%
[~, k] = size(xTe);
[~, n] = size(T);
ypredict = evaltree(T, xTe); % predictions of original tree
accuracy = sum(ypredict == y) / k; % accuracy of xTe

for i = (n+1)/2-1 : -1 : 1
	temp = T([2,3,4,5], i); % save the slots that are going to be removed
	if T(2, 2*i) == 0 % when it is already a leaf  
		T([2,3,4,5], i) = 0; % remove this node
	end
	
	yp_temp = evaltree(T, xTe);
	accuracy_temp = sum(yp_temp == y) / k;
	if (accuracy_temp > accuracy) 
		accuracy = accuracy_temp;
	else % this pruning doesn't improve accuracy
		T([2,3,4,5], i) = temp; % put the node back
	end
end

