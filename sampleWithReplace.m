function [ sample_data ] = sampleWithReplace( dataset )
    len = size(dataset,1) ;
    randidx = randsample(len,len,true) ;
    sample_data = dataset(randidx,:) ;
end

