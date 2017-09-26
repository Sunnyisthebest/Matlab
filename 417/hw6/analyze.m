function output=analyze(kind,truth,preds)		
%
% Analyses the average accuracy/error for a test set
% Input:
% kind='acc' classification accuracy
% kind='abs' absolute loss
% kind='zero_one' 0/1 loss 
% (other values of 'kind' will follow later)
% 

switch kind
    case 'zero_one'
        % calculate the average 0/1 loss btw truth and preds
		output=sum(truth~=preds)/length(truth);  
    case 'abs'
        % calculate the average absolute difference btw truth and preds
		output=sum(abs(truth-preds))/length(truth);
	case 'acc' 
		% calculate the average accuracy btw truth and preds
		  if (isempty(truth) && isempty(preds)) 
		  	output=0;
		  else
		  	output=sum(truth==preds)/length(truth);
		  end;
end;

