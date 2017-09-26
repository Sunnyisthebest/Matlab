function F=forest(X,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% X  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees
%
% OUTPUT:
% F | Forest;

F = cell(1,nt);
n=length(y);

for i = 1:nt
    index = randsample(n, n,true);
    xTr = X(:,index); % xTr is the sample training data;
    yTr = y(1,index);
    T = id3tree(xTr,yTr);
    C = setxor(1:n,index);
    xTe = X(:,C);
    yTe = y(1,C);
    T = prunetree(T,xTe,yTe) ;
    F{1, i} = T; %add the tree to a cell array
end;

