dataset = importdata('abalone.data.txt') ;
data = dataset.data ;
minidata = data(1:10,:) ;
disp(minidata) ;
% [bootstat,bootsam] = bootstrp(10,[],minidata);
% disp(bootstat) ;
len = size(minidata,1) ;
randidx = randsample(len,len,true) ;
disp(minidata(randidx,:)) ;