 clear
 load ('data.mat');
 MyNetwork = nnetwork;
 %,Inputsize, inputcount, HiddenLayers, NeuronsPerLayer, bias,learnrate , OutputCount, outputlabels
 MyNetwork.init(4000,1000,2,20,0,1,2,datalabels);
 
count =1;
minimum =1;
timoutup=0;
timeoutdown=0;
found=false;

zigzag=0;
zig=0;
zag=0;

testSetSize =50;
numoutputs = 2;
 
while found ==  false,
    fprintf('Training run %s  \n',num2str(count))
    MyNetwork.train(trainset,trainsettargets);
    x(count)=count;
    
    validationerror=0;
    for j=1:testSetSize
        result = MyNetwork.predict(testset(j,:)); 
        error=0;
        for k =1:numoutputs
           outputerror = result(k) * (1 - result(k))*(testsettargets(j,k) - result(k)); 
           error = error+outputerror^2;
        end
        validationerror = validationerror + (error/numoutputs);
    end    
    totalvalidationerror(count) = validationerror/testSetSize;
    totaltrainerror(count) = MyNetwork.iterationError;
    fprintf('Validation set error %s \n \n ',num2str(validationerror/testSetSize))
    plot(x,totalvalidationerror,'--*',x,totaltrainerror,'-');
    title('Graph of Validation and Train Error over time (iterations)')
    legend('Validation Error','Train Error');
    xlabel('Iterations'); % x-axis label
    ylabel('Mean Squared Error'); % y-axis label
    pause(.00000000000001);
    
    if (count>1) && (totalvalidationerror(count)<totalvalidationerror(minimum))
        minimum = count;
        temp = MyNetwork;
    end
    
    %how long to go up before Quitting
    if (count>1) && (totalvalidationerror(count)>totalvalidationerror(count-1))
        timeoutup= timeoutup+1;    
    else
        timeoutup=0;
    end
    
    %how long to go down before Quitting
    if (count>1) && (totalvalidationerror(count)<totalvalidationerror(count-1)) && (totalvalidationerror(count)>totalvalidationerror(minimum))
        timeoutdown= timeoutdown+1;    
    else
        timeoutdown=0;
    end
    
    if (count>1) && (totalvalidationerror(count)<totalvalidationerror(count-1))
        if (zag==1)
           zigzag = zigzag+1; 
        else
           zigzag=0;
        end
        zig=1;
        zag=0;
    end
    
    if (count>1) && (totalvalidationerror(count)>totalvalidationerror(count-1))
        if (zig==1)
           zigzag = zigzag+1; 
        else
            zigzag=0;
        end
        zig=0;
        zag=1;
    end
    
    %set found if  timouts reached
    if (timeoutup>300) || (timeoutdown>350) 
        found=true;
    end
    
    
    count= count + 1;
    
end

message = sprintf('Minimum Found On Iteration %s \n The Test Error At This Iteration Was %s \n The Validation Error At This Iteration Was %s \n',num2str(minimum),num2str(totaltrainerror(minimum)),num2str(totalvalidationerror(minimum)));
MyNetwork = temp;
h = msgbox(message,'Training Completed');
%plot(x,totalvalidationerror,'--*',x,totaltrainerror,'-');