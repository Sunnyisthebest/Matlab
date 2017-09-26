function [ iternum,diff_w] = perceptron_experiment ( N, d, num_samples )
%perceptron_experiment Code for running the perceptron experiment in HW1
%   Inputs: N is the number of training examples
%           d is the dimensionality of each example (before adding the 1)
%           num_samples is the number of times to repeat the experiment
%   Outputs: num_iters is the # of iterations PLA takes for each sample
%            bound_minus_ni is the difference between the theoretical bound
%               and the actual number of iterations
%      (both the outputs should be num_samples long)

close all;
clc;

%In order to make your test more convenience I give this fuction an input
%If you want to use this fuction, you only need to delet these three lines
N = 100;% the number of training examples
d = 10;%d is the dimensionality of each example (before adding the 1)
num_samples = 1000;% num_samples is the number of times to repeat the experiment


%initial iterate number(itenum)
iternum = zeros(1,num_samples);
%initial bound
bound=zeros(1,num_samples);
%initail T difference(dif)
dif=zeros(1,num_samples);
d=d+1;
%initial the weight(wt)
%wt=zeros(1,d);
for i = 1:num_samples
    
%generate a random weight vector for a linear seperatable space
    w = rand(1,d);
    %add a value for the w(1)
    w(1) = 0;
%generate random data samples
% the value of these samples are (0,1)
    x = rand(d, N)*2-1;
    x(1,:) = 1;
   %get a label of every data sample
    y = sign(w*x);
   %merge x and y to generate a train vectors which is also the input of
   %PLA
    trainvectors=[x;y];
    [iternum(i),wt] = perceptron_learn(trainvectors);
    %Usd to calculate the sum of the difference between wt(calculared by PLA ) 
    %and w(the weight used to generate the linear separatable space) 
    diff_w = sum(abs(wt - w));
    %use this to calclate the bound
    %These equipments are refered from the Learning from data
    R_max = max(sum(x.*x));
    wsqur = w*w';
    p = y.*(w*x);
    pmin = min(p);
    psqur = pmin^2;
    bound(i) = R_max*wsqur/psqur;
    dif(i) = (bound(i) - iternum(i));
    
    
end
%open a figure to figure the iteration number
figure;
hist(iternum);
title('iteration number');

%open a figure to draw the log of T difference
figure;
hist(log(dif));
title('histogram of the log of T difference');

end