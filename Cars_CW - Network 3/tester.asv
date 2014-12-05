correct =0;

for i=1:50,
   results = MyNetwork.predict(testset(i,:)); 
   highest =0;
   index =0;
   for j=1:2,
       if results(j)>highest
          highest = results(j);
          index = j;
       end      
   end
   
   if testsettargets(i,index)==1
      correct = correct +1; 
   else
       %fprintf('wrong \n \n');
      
   end
   
    
end

correct2 =0;

for i=1:1000,
   results = MyNetwork.predict(trainset(i,:)); 
   highest =0;
   index =0;
   for j=1:2,
       if results(j)>highest
          highest = results(j);
          index = j;
       end      
   end
   
   if trainsettargets(i,index)==1
      correct2 = correct2 +1; 
   else
       %fprintf('wrong \n \n');
      
   end
   
    
end