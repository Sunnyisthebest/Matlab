function [ overfit_m ] = computeOverfitMeasure( true_Q_f, N_train, N_test, var, num_expts )
%COMPUTEOVERFITMEASURE Compute how much worse H_10 is compared with H_2 in
%terms of test error. Negative number means it's better.
%   Inputs
%       true_Q_f: order of the true hypothesis
%       N_train: number of training examples
%       N_test: number of test examples
%       var: variance of the stochastic noise
%       num_expts: number of times to run the experiment
%   Output
%       overfit_m: vector of length num_expts, reporting each of the
%                  differences in error between H_10 and H_2

overfit_m = zeros(num_expts,1);
for i = 1:num_expts
    [trainset, testset] = generate_dataset( true_Q_f, N_train, N_test, sqrt(var));
    H2train = computeLegPoly( trainset(:,1), 2);
    H2 = glmfit(H2train, trainset(:,2),'normal','constant','off');
    
    H10train = computeLegPoly( trainset(:,1), 10);
    H10 = glmfit(H10train, trainset(:,2),'normal','constant','off');
    H10test = computeLegPoly( testset(:,1),10 );
    H10Eout = sum((H10test*H10 - testset(:,2)).^2)/N_test;
    H2test = computeLegPoly( testset(:,1),2 );
    H2Eout = sum((H2test*H2 - testset(:,2)).^2)/N_test;
    
    overfit_m(i,1) = H10Eout - H2Eout;

end
    






