total_impute = knnimpute (Totalgene(3:end,2:end), 7, 'Median', true);
Z = total_impute;
total_impute = total_impute';
[coeff,score,latent] = pca(total_impute);
A = coeff*diag([latent]);
AA = [];
for i = 1:size(A,2)
    AA(:,i) =  A(:,i).*A(:,i)/sum(A(:,i).*A(:,i));
end
contribution = sum(AA,2);
contribution_sort = sort(contribution,'descend');
index = [];
for i = 1:200
    index(i) = find(contribution==contribution_sort(i));
end
load('genename.mat', 'symbol');
name = symbol(index+1);

[U,S,V] = svd(total_impute);




n=20;
error = zeros(1,n);
Classes = Totalgene(2,2:end)';
ZZ = [];
for j=1:4
        Z1 = Z((1+(j-1)*2140):j*2140,:);
        [Zica A T mu] = myICA(Z1,5);
        ZZ = [ZZ;Zica];
end
[Zica A T mu] = myICA(Z,30);

for k=2:2
    [Zica A T mu] = myICA(ZZ,k);
    lowdimdata = Zica;
    if k == 2
        figure;
        plot(lowdimdata(1,1:176),lowdimdata(2,1:176),'ro',lowdimdata(1,177:end),lowdimdata(2,177:end),'go');
        legend('Control', 'Patient');
    end
    idx = kmeans(lowdimdata',2,'Distance','correlation','MaxIter' , 10000);
    error(k) = sum(abs(idx - Classes));
    if error(k)>=182
        error(k) = 363-error(k);
    end
    false1(k) = sum(abs(idx(1:176) - Classes(1:176)));
    false2(k) = sum(abs(idx(177:end) - Classes(177:end)));
    if false1(k)+false2(k)>=182
        temp = idx;
        idx(find(temp == 1)) = 2;
        idx(find(temp == 2)) = 1;
        false1(k) = sum(abs(idx(1:176) - Classes(1:176)));
        false2(k) = sum(abs(idx(177:end) - Classes(177:end)));
    end
    hiddenLayerSize = 10;
    net = patternnet(hiddenLayerSize);

    % Set up Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;
    %inputs = features2;
    inputs = lowdimdata;
    targets = Classes'-1;

    % Train the Network
    [net,tr] = train(net,inputs,targets);

    % Test the Network
    outputs = net(inputs);
    errors = gsubtract(targets,outputs);
    performance3(k) = perform(net,targets,outputs);
end
figure;

plot(1:length(false1),false1,'o');
xlabel('K');
ylabel('wrong clustered patient');
figure;
plot(1:length(false2),false2,'o');
xlabel('K');
ylabel('wrong clustered Control');
figure;
plot(1:length(error),error,'o');
xlabel('K');
ylabel('wrong clustered number');




[coeff,score,latent] = svd(total_impute);
n=20;
error = zeros(1,n);
Classes = Totalgene(2,2:end)';
for k=2:n
    T = coeff(:,1:k);
    lowdimdata = T' * total_impute';
    idx = kmeans(lowdimdata',2,'Distance','correlation','MaxIter' , 10000);
    error(k) = sum(abs(idx - Classes));
    if error(k)>=182
        error(k) = 363-error(k);
    end
    false1(k) = sum(abs(idx(1:176) - Classes(1:176)));
    false2(k) = sum(abs(idx(177:end) - Classes(177:end)));
    if false1(k)+false2(k)>=182
        temp = idx;
        idx(find(temp == 1)) = 2;
        idx(find(temp == 2)) = 1;
        false1(k) = sum(abs(idx(1:176) - Classes(1:176)));
        false2(k) = sum(abs(idx(177:end) - Classes(177:end)));
    end
end
figure;

plot(1:length(false1),false1,'o');
xlabel('K');
ylabel('wrong clustered patient');
figure;
plot(1:length(false2),false2,'o');
xlabel('K');
ylabel('wrong clustered Control');
figure;
plot(1:length(error),error,'o');
xlabel('K');
ylabel('wrong clustered number');