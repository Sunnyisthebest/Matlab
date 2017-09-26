function [indices,dists]=findknn(xTr,xTe,k);
% function [indices,dists]=findknn(xTr,xTe,k);
%
% Finds the k nearest neighbors of xTe in xTr.
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
% 
% Output:
% indices = kxm matrix, where indices(i,j) is the i^th nearest neighbor of xTe(:,j)
% dists = Euclidean distances to the respective nearest neighbors
%

% output random results, please erase this code

    


%% fill in code here
	
	[~,ntr]=size(xTr); 
    
    %K should not bigger than the number of training data, 
    if k>ntr,
        k=ntr;
    end;
    
    %get the k-nearest neighbor
    [D, I] = sort(l2distance(xTr, xTe), 'ascend');
    
    dists = D(1:k, :);
    indices = I(1:k, :); 
    
%%	%
	
