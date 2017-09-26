function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here
[~, q] = size(T); %q: total of nodes
[~,n] = size(xTe);
ypredict = zeros(1,n);
 

for i = 1:n % classify one at a time
    node = 1; % start from the root
    while node < q
        if T(4,node)==0 && T(5,node)==0 % if the node is a leaf, break
            break; 
        end;
       
        if xTe(T(2,node), i) <= T(3,node) % if classify to left
            node =T(4,node);
        else
            node = T(5,node);
        end
    end
   
    ypredict(1,i) = T(1, node); % the y is the predication of final node
end;
