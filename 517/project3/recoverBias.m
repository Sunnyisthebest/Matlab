function bias=recoverBias(K,yTr,alphas,C)
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : nx1 input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%


% YOUR CODE 

n=length(yTr);
ret = 0;
max = -10000;
for i = 1 : n
	if alphas(i, :) > 0 && alphas(i, :) < C
		b = 1 / yTr(i, :) - yTr' .* alphas' * K(:, i);
		if (C - b ^ 2 + b ^ 2) > max
			max = (C- b) ^ 2 + b ^ 2;
			ret = b;
		end
	end
end

bias = ret;