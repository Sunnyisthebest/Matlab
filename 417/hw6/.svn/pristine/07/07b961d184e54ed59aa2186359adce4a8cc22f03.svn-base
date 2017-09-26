function BDT=boosttree(X,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data X with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% X  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here;
if nargin <= 3
    maxdepth = 3;
end

if nargin < 3
    nt = 100;
end



% Initialize
[~,n] = size(X);
weights = ones(1,n)./n;
BDTemp = cell(1,nt);
T = id3tree(X,y,maxdepth,weights); 
BDTemp{1}=T;

for i = 2:1:nt
         
    BDTemp{i} = id3tree(X,y,maxdepth,weights);
    
    % Get predictions of learner
    ypredict = evaltree(BDTemp{i},X);
    ypredict = (ypredict-1.5).*2;
    y = (y-1.5).*2;
    
    % Calculate error
    index=weights(y~=ypredict);
    esp = sum(index);
    
    % Break if error is really bad
    if esp >0.5
        break;
    end
    
    % Get learning reate
    alpha = 0.5*log((1-esp)/esp);
    
    % Calculate new weights
    weights = weights.*exp(-alpha.*ypredict.*y)./(2*sqrt(esp*(1-esp)));
    
    % Need old y for tree train
    y = 0.5.*y + 1.5;
end

% Count how many non-null elements are in cell array
BDT = cell(1,i);
for j=1:i
    BDT{j} = BDTemp{j};
end