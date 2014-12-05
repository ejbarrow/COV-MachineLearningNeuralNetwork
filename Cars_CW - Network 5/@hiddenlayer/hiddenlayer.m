classdef hiddenlayer < handle
   properties
      inputs
      outputs
      
      bias
      learningrate
      outputerror
      
      neurons = hiddenNeuron;
      
      numNeurons
      numInputs
      
      weights 
      
      onesarray
      
      neuronerror
      errorArray %to pass to previous array
      
      debug
       
   end
   
   methods
       
       function obj = hiddenlayer

       end
       
        function obj = init(obj,Inputsize, Neuronsize, bias,learnrate)
          obj.bias(1:Neuronsize) = bias;
          obj.numInputs = Inputsize;
          obj.numNeurons=Neuronsize;
          obj.learningrate = learnrate;
          obj.outputerror=0;
          %obj.weights = zeros(Neuronsize);
          obj.onesarray=ones(1,Neuronsize);
          
          obj.neurons=hiddenNeuron.empty(0);
          %obj.neurons(1:Neuronsize)=hiddenNeuron;
             for i= 1:Neuronsize,
                 for j= 1:Inputsize,
                      rand =randi([-100, 100]); % -1 and 1
                      rand=rand/100;%redundant
                      rand=rand/Inputsize;
                      %obj.neurons(i) = hiddenNeuron;
                      % obj.neurons(i).init(Inputsize,bias,learnrate);
                      %obj.neurons(i).setinput(ins);
                      obj.weights(i,j) = rand;
                 end
             end                        
        end
        
        function obj = SetInputs(obj,input)
          obj.inputs = input;
       
%              for i= 1:obj.numNeurons,
%                   obj.neurons(i).setinput(input);
%              end                        
        end
        
        function obj = getOutputs(obj)       
%              for i= 1:obj.numNeurons,
%                   obj.neurons(i).calculateoutput();
%                   obj.outputs(i) = obj.neurons(i).output;
%              end     

             obj.outputs = sigmoid(obj.inputs*transpose(obj.weights)+obj.bias);
              
             %obj.outputs = obj.inputs * transpose(obj.weights);
                    %sigmoid matrix
                    
        end
        
        function obj = backProp(obj, errorArrayinput)       
           
%              for i= 1:obj.numNeurons,
%                   obj.neurons(i).backProp(errorArrayinput(i));
%                   obj.weights(i,:) = obj.neurons(i).weights;
%              end    

                inputonesarray=ones(1,obj.numInputs);

                obj.neuronerror = obj.outputs .* (1-obj.outputs) .* errorArrayinput;
                obj.errorArray = obj.neuronerror * obj.weights;
                nerror = transpose(obj.neuronerror) * inputonesarray;
                inputmat =transpose( transpose(obj.inputs)*obj.onesarray);
                obj.debug=nerror;
                obj.weights = obj.weights + (obj.learningrate * nerror .* inputmat);
                obj.bias = obj.bias + (obj.learningrate * obj.neuronerror);
            
%              for i= 1:obj.numInputs,
%                 obj.errorArray(i)=0;
%                 for j= 1:obj.numNeurons,
%                   obj.errorArray(i) = obj.errorArray(i)+ obj.neurons(j).inputError(i) ;
%                 end 
%              end   
            
        end
       
       
   end
   
   
end
       