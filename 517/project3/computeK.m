function K = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxn);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%

if (nargin==1)
	Z=X;
end

switch (kernel_type)
    case 'linear'
        K = X' * Z;
    case 'polynomial'
        K = (1 + X'*Z).^param;
    case 'poly'
        K = (1 + X'*Z).^param;
    case 'rbf'
        K = exp(-param * l2distance(X, Z));
    otherwise
        display('please choose a right kernel name as input!');
end
end

%%YOUR CODE HERE
