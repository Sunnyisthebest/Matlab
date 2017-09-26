function [result,totaltime]=knneval()

fprintf('Face Recognition:\n')
load('faces');
tic;
predsclassic=knnclassifier(xTr,yTr,xTe,1);
preds=competition(xTr,yTr,xTe);
result1=analyze('acc',yTe,predsclassic);
result2=analyze('acc',yTe,preds);
totaltime=toc;
fprintf('using classic knn, you obtained %2.2f%% classification acccuracy in %2.4f seconds\n',result2*100.0,totaltime);
fprintf('using competition, you obtained %2.2f%% classification acccuracy in %2.4f seconds\n',result2*100.0,totaltime);

fprintf('\n');
fprintf('Handwritten digits Recognition: (3-nn)\n')
load('digits.mat');
tic;
predsclassic=knnclassifier(xTr,yTr,xTe,2);

preds=competition(xTr,yTr,xTe);
result1=analyze('acc',yTe,predsclassic);
result2=analyze('acc',yTe,preds);
totaltime=toc;
fprintf('using classic knn, you obtained %2.2f%% classification acccuracy in %2.4f seconds\n',result2*100.0,totaltime);
fprintf('using competition, you obtained %2.2f%% classification acccuracy in %2.4f seconds\n',result2*100.0,totaltime);





