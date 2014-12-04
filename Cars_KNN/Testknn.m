correct=0;

for i =1:50
   prediction = predict(mdl,testset(i,:));
   
   if strcmp(prediction ,'No Car') && testsettargets(i,2) == 1
      correct = correct +1; 
   end
   
    if strcmp(prediction ,'Car') && testsettargets(i,1) == 1
      correct = correct +1; 
   end
    
end

correct2=0;

for i =1:1000
   prediction = predict(mdl,trainset(i,:));
   
   if strcmp(prediction ,'No Car') && trainsettargets(i,2) == 1
      correct2 = correct2 +1; 
   end
   
    if strcmp(prediction ,'Car') && trainsettargets(i,1) == 1
      correct2 = correct2 +1; 
   end
    
end