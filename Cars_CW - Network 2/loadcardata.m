dataset = zeros(1050,4000);
datatargets = zeros(1050,2);

for i=0:499
    name=strcat('TrainImages/neg-',num2str(i),'.pgm');
    I = imread(name);
    B=I(:);
    dataset(i+1,:)=transpose(B);
    datatargets(i+1,:)=[0,1];
end

for i=0:549
    name=strcat('TrainImages/pos-',num2str(i),'.pgm');
    I = imread(name);
    B=I(:);
    dataset(i+501,:)=transpose(B);
    datatargets(i+501,:)=[1,0];
end