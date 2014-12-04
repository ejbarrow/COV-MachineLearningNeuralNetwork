KNNtrainsettargets = cell(1000,1);
for i=1:1000
   if trainsettargets(i)== 1
       KNNtrainsettargets(i,1) = {'Car'};
   else
       KNNtrainsettargets(i,1)={'No Car'};
       
   end
    
end

KNNtestsettargets = cell(50,1);

for i=1:50
   if testsettargets(i)== 1
       KNNtestsettargets(i,1) = {'Car'};
   else
       KNNtestsettargets(i,1)= {'No Car'};
       
   end
    
end