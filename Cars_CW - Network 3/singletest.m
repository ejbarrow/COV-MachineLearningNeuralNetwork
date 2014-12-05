ins = [4,255,100,27,190];
ins2 = [255,9,200,227,100];
test = hiddenNeuron;

test.init(5,1,0.02);
test.setinput(ins);


    test.calculateoutput();
    outputerror = (0-test.output ) * test.output * (1-test.output);
    test.backProp(outputerror);


test