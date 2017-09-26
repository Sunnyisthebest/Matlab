clear all;
clc;


%% training
train = csvread('clevelandtrain.csv',1,0);
[N, d] = size(train);
Xtrain = train(:,1:(d-1));
ytrain = train(:,d);
ytrain = ytrain*2 - 1; % change label from 0 1 to -1 +1
winit = zeros(d,1);
maxits = 1000000;
eta = 0.00001;

tic
[ wtrain, Eintrain, numits ] = logistic_reg( Xtrain, ytrain, winit, maxits, eta );
toc
%% testing
test = csvread('clevelandtest.csv',1,0);
[N, d] = size(test);
Xtest = test(:,1:(d-1));
ytest = test(:,d);
ytest = ytest*2 - 1; % change label from 0 1 to -1 +1

testerror = find_test_error( wtrain, Xtest, ytest );

%% MATLAB glmfit training
ytrain = train(:,d);
tic
w_matlab = glmfit(Xtrain,ytrain,'binomial');
toc
%% testing
test_error_matlab = find_test_error( w_matlab, Xtest, ytest );
%}
%% generate new feature

[N, d] = size(train);
eta = 0.01;

X_train2 = zscore(Xtrain);
[ w_train2, Ein_train2, num_its2 ] = logistic_reg( X_train2, ytrain, winit, maxits, eta );

%% testing
test = csvread('clevelandtest.csv',1,0);
[N, d] = size(test);
Xtest = test(:,1:(d-1));
ytest = test(:,d);
ytest = ytest*2 - 1; % change label from 0 1 to -1 +1

testerror = find_test_error( w_train2, Xtest, ytest );
