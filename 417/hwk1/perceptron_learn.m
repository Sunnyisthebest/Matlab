function [iteration,wt] = perceptron_learn(trainvectors)
%perceptron_learn Run PLA on the input data
%   Inputs: data_in: Assumed to be a matrix with each row representing an
%                    (x,y) pair, with the x vector augmented with an
%                    initial 1, and the label (y) in the last column
%   Outputs: w: A weight vector (should linearly separate the data if it is
%               linearly separable)
%            iterations: The number of iterations the algorithm ran for
%FunRandArray.m

%n = 11;
%trainvector is a merge of labels and data samples 
%use this to get the number of the row
[trrow,~] = size(trainvectors);  
%initial wt
wt=zeros(1,trrow-1);
%get labels
y=trainvectors(trrow,:);
%initial change
change=true;
%initial iteration
iteration=0;
%clear the last row of the traincvectors.
%Thus we can get data samples
trainvectors(trrow,:)=[];
i = 0;

while(change==true)
    i = i+1;
    %for i=1:trrow
        if(i==1)
             wt = wt + y(i)*trainvectors(:,i)';
        else
        %x=[trainvectors(1,1:trcol-1),1];
        if sum(sign(wt*trainvectors) ~= y)>0
            a = abs(sign(wt*trainvectors) - y);
            index = find(a==2);
            [~,b] = size(index);
            if b==0
                change = false;
                %break;
            else
                 wt = wt + y(index(1))*trainvectors(:,index(1))';
                %change = true;
                iteration=iteration +1;
            end
        else
            change = false;
        end
         %if ~change || iteration >= 2 * trrow  
 	        %break;  
         %end
        %end
    end

            
        
end

% fprintf('Train the vector. Finshed with iteration %d times\n',iteration);
% fprintf('The final vector is \n');
% fprintf(w);


end