function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% 
%
[d,n]=size(X); % dimension of X
if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    D=l2distance(X,X);

else  % case when there are two inputs (X,Z)
	%% fill in code here
    
    [~,m]=size(Z); % number of input vectors in Z
    if (d == 1)
        xx = X .* X;
        zz = Z .* Z;
    else
        xx = sum(X .* X);
        zz = sum(Z .* Z);
    end
    xz=X'*Z; 
    D = sqrt(repmat(xx',[1 size(zz,2)]) + repmat(zz,[size(xx,2) 1]) - 2*xz);

% make sure result is all real
    D = real(D); 

% force 0 on the diagonal? 
%if (df==1)
%  D = D.*(1-eye(size(D)));
end;

%




