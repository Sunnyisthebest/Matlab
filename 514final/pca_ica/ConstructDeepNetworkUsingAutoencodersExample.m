%% Construct Deep Network Using Autoencoders
% Load the sample data.

% Copyright 2015 The MathWorks, Inc.
total_impute = knnimpute (Totalgene(3:end,2:end), 7, 'Median', true);
X = total_impute;
T = Totalgene(2,2:end)-1;

vector = randperm(size(X,2));
M = X;
N = T;
for i=1:size(X,2)
    X(:,i)=M(:,vector(i));
    T(:,i)=N(:,vector(i));    
end

    hiddenLayerSize = 10;
    net = patternnet(hiddenLayerSize);

    % Set up Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 5/100;
    net.divideParam.testRatio = 25/100;
    %inputs = features2;
    inputs = X;
    targets = T;

    % Train the Network
    [net,tr] = train(net,inputs,targets);

    % Test the Network
    performance3 = zeros(1,size(X,1));
for i = 1:size(X,1)
    i
    inputs = X;
    inputs(i,:) = 0;
    outputs = net(inputs);
    performance3(i) = perform(net,targets,outputs);
end


contribution_sort = sort(performance3);
index = [];
for i = 1:20
    index(i) = find(performance3==contribution_sort(i));
end
load('genename.mat', 'symbol');
name = symbol(index+1);
%[X,T] = wine_dataset;
%%
% Train an autoencoder with a hidden layer of size 10 and a linear transfer
% function for the decoder. Set the L2 weight regularizer to 0.001,
% sparsity regularizer to 4 and sparsity proportion to 0.05.

hiddenSize = 30;
autoenc1 = trainAutoencoder(X,hiddenSize,...
    'L2WeightRegularization',0.001,...
    'SparsityRegularization',4,...
    'SparsityProportion',0.05,...
    'MaxEpochs' ,120,...
    'DecoderTransferFunction','purelin');

%%
% Extract the features in the hidden layer.
features1 = encode(autoenc1,X);

%%
% Train a second autoencoder using the features from the first autoencoder. Do not scale the data.
for i = 2:2
hiddenSize = i;
autoenc2 = trainAutoencoder(features1,hiddenSize,...
    'L2WeightRegularization',0.001,...
    'SparsityRegularization',4,...
    'SparsityProportion',0.05,...
    'DecoderTransferFunction','purelin',...
    'ScaleData',false);
%%
% Extract the features in the hidden layer.
features2 = encode(autoenc2,features1);
if size(features2,1) == 2
    index2 = find(T==1);
    index1 = find(T==0);
    figure;
    plot(features2(1,index2),features2(2,index2),'ro',features2(1,index1),features2(2,index1),'go');
    legend('Control', 'Patient');
end

%k-means
k=i;
    idx = kmeans(features2',2,'Distance','correlation','MaxIter' , 10000);
    error(k) = sum(abs(idx - Classes));
    if error(k)>=182
        error(k) = 363-error(k);
    end
%%
% Create a Pattern Recognition Network
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);

% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
%inputs = features2;
inputs = features2;
targets = T;

% Train the Network
[net,tr] = train(net,inputs,targets);

% Test the Network
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance2(i) = perform(net,targets,outputs);

end
plotconfusion(T,outputs);
% View the Network
view(net)