load('1uMDA_0-500mMgly.mat')
data = [];
stim = [];
for i = 1:12
    if i<=7
        stim2 = ones(1,30)*min((i-1)*100,500);
    else
        stim2 = ones(1,30)*(12-i)*100;
    end
    stim1 = [zeros(1,15),ones(1,30),zeros(1,15)];
    stim2 = [zeros(1,15),stim2,zeros(1,15)]/250;
    stim(:,1+(i-1)*60:i*60) = [stim1;stim2];
    
    data(:,1+(i-1)*60:i*60) = [AllData2(:,:,i)'];
end

% plot data
ncases = length(data);
move = data(3:7,:);
[Zica A T mu] = myICA(move,2);
pc = pca(move');
D_1 = pc'*move;
figure;
plot(1:720,D_1,'r');
plot(1:720,Zica,'g');
Zr = T \ pinv(A) * Zica + repmat(mu,1,ncases);
for i  = 1:5
    subplot(5,1,i);
    plot(1:ncases,Zr(i,:),'r',1:ncases,data(i+2,:),'g');
end
suptitle('plot data');