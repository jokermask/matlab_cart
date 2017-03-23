dataset = importdata('abalone.data.txt') ;
origin_data = dataset.data ;
labels = {'Length';'Diam';'Height';	'Whole';'Shucked';'Viscera';'Shell';'Rings'} ;
test_runtimes = 50 ;
ae = 0 ;
rr = 0 ;
for i=1:test_runtimes
    data = sampleWithReplace(origin_data) ;%bootstrap sampling
    len = floor(length(data)/4*3) ;
    train_data = data(1:len,:) ;
    test_data = data(len:end,:) ;
    test_y_truth = test_data(:,end) ;
%     tree = createTree(train_data,labels,0) ;
%     predict_y = predict(tree,test_data,labels) ;
%     com_matrix = [predict_y,test_y_truth] ;
%     count = sum(predict_y==test_y_truth) ;
    
%     disp(com_matrix) ;
%     disp(mae) ;
%     disp(rr) ;

%plot single runtime
%     x = 1:1:size(test_y_truth,1) ;
%     plot(x,predict_y,'-b',x,test_y_truth,'-r') ;

%      ae = ae+sum(abs(predict_y-test_y_truth))/size(test_y_truth,1) ;
%      rr = rr+count/size(test_y_truth,1) ;
    
    %trian with office tools fitctree
    
    std_tree = fitctree(train_data(:,1:7),train_data(:,end)) ;
    % view(std_tree) ;
    std_y = predict(std_tree,test_data(:,1:7)) ;
    % disp([std_y,y]) ;
    ae = ae+sum(abs(std_y-test_y_truth))/size(test_y_truth,1) ;
    rr = rr+sum(std_y==test_y_truth)/size(test_y_truth,1) ;
end
mae = ae / test_runtimes ;
mrr = rr / test_runtimes ;
disp('mae') ;
disp(mae) ;
disp('mrr') ;
disp(mrr) ;

