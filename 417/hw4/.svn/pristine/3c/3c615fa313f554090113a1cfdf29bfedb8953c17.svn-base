function [ train test ] = generate_dataset( Q_f, N_train, N_test, sigma )
%GENERATE_DATASET Generate training and test sets for the Legendre
%polynomials example
%   Inputs:
%       Q_f: order of the hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       sigma: standard deviation of the stochastic noise
%   Outputs:
%       train_set and test_set are both 2-column matrices in which each row
%       represents an (x,y) pair

a = normrnd(0,1,Q_f+1,1);
normalizer = 0;
for q = 0:Q_f
    normalizer = normalizer + 1/(2*q+1);
end

a = a/sqrt(normalizer);
epsilon_train = normrnd(0,1,N_train,1);
epsilon_test = normrnd(0,1,N_test,1);
trainx = 2*rand([N_train,1]) - 1;
testx = 2*rand([N_test,1]) - 1;
trainy = computeLegPoly(trainx, Q_f)*a + sigma*epsilon_train;
testy = computeLegPoly(testx, Q_f)*a+sigma*epsilon_test;
train = [trainx trainy];
test = [testx testy];

end

