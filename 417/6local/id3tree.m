function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%
[~,n] = size(xTr);

if nargin==3
    weights=ones(1,n)/n;% equal weights if weights not specified
    a = 1+ (maxdepth-1)*maxdepth;   
end

if nargin==2
    maxdepth = inf;
    weights=ones(1,n)/n;
    %set the maximum number of nodes as every leaf has only 1 observation
    a = (1+n)*n/2;
else 
    a = 1+ (maxdepth-1)*maxdepth;
end

P = cell(2,a); 
T = zeros(6,a);



index = 2; %next subtree

P{1,1} = xTr; %store remain data
P{2,1} = yTr;

for i = 1:a
    
    if i==index
        T(:,i:end) = [];
        break;
    end
    
    x = P{1,i};
    y = P{2,i};
    [f,c,~] = entropysplit(x,y,weights);
    T(1,i) = mode(y);
    
    if ~(f==0 || size(x,2)==1)
        T(2:4,i) = [f;c;index];
        P{1, index} = x(:,(x(f,:        )<=c));%left
        P{2, index} = y(:,(x(f,:)<=c));%left
        T(6,index) = i;
        T(5,i) = index +1;
        P{1, index+1} = x(:,(x(f,:)>c));%right
        P{2, index+1} = y(:,(x(f,:)>c));%right
        T(6,index+1) = i;
     %if further split would exceed the maximum number of nodes allowed, set the index of left & right subtrees to zero
     %otherwise, move on the the next node
        if index+2>a
            T(4:5,i)=0;
        else
            index = index+2;
        end
    end

end     
%the if condition is needed, otherwise, the dimension of T may exceed 
%that allowed by maxdepth since we have T(6,next_node) = i in the for loop
if size(T,2)> a
    T(:, a+1:end) = [];
end;





