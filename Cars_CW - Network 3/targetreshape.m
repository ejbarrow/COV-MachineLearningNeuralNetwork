temp = zeros(1050,4002);
for i = 1:1050,
    temp(i,1:4000) = dataset(i,1:4000);
    temp(i,4001:4002) = datatargets(i,1:2);
end

shuffledArray = temp(randperm(size(temp,1)),:);

for i = 1:1050,
    randomDataset(i,1:4000) = shuffledArray(i,1:4000);
    randomDatasetTargets(i,1:2) = shuffledArray(i,4001:4002);
end