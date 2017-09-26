%Script that runs the set of necessary experiments. This is an example that
%you can use; you should change it as appropriate to answer the question to
%your satisfaction.

Q_f = 5:5:20; % Degree of true function
N = 40:40:120; % Number of training examples
var = 0:0.5:2; % Variance of stochastic noise

expt_data_mat = zeros(length(Q_f), length(N), length(var));

for ii = 1:length(Q_f)
    for jj = 1:length(N)
        for kk = 1:length(var)
            expt_data_mat(ii,jj,kk) = median(computeOverfitMeasure(Q_f(ii),N(jj),1000,var(kk),500));
        end
    end
    fprintf('.');
end

%var=0.5 x=Q_f
A=5:5:20;
L1=expt_data_mat(:,1,2);
L2=expt_data_mat(:,2,2);
L3=expt_data_mat(:,3,2);
figure(1)
plot(A,L1,'-*',A,L2,'-D',A,L3,'-o');
%N=80 x=variance 

B=0:0.5:2;
L4=zeros(1,5);
L5=zeros(1,5);
L6=zeros(1,5);
L7=zeros(1,5);
for k=1:5
    L4(k)=expt_data_mat(1,2,k);
    L5(k)=expt_data_mat(2,2,k);
    L6(k)=expt_data_mat(3,2,k);
    L7(k)=expt_data_mat(4,2,k);
end
figure(2)
plot(B,L4,'-*',B,L5,'-D',B,L6,'-o',B,L7,'-+');
%Q_f=15 X=N
C=40:40:120;
L8=expt_data_mat(3,:,1);
L9=expt_data_mat(3,:,2);
L10=expt_data_mat(3,:,3);
L11=expt_data_mat(3,:,4);
L12=expt_data_mat(3,:,5);
figure(3)
plot(C,L8,'-*',C,L9,'-D',C,L10,'-o',C,L11,'-+',C,L12,'-x');