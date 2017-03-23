dataset = importdata('abalone.data.txt') ;
origin_data = dataset.data ;
labels = {'Length';'Diam';'Height';	'Whole';'Shucked';'Viscera';'Shell';'Rings'} ;
test_runtimes = 50 ;
ae = 0 ;
rr = 0 ;

for i=1:test_runtimes
    data = sampleWithReplace(origin_data) ;
    split_len = floor(length(data)/4*3) ;
    train_data = data(1:split_len,:) ;
    test_data = data(split_len:end,:) ;
    train_data_len = size(train_data,1) ;
    test_data_len = size(test_data,1) ;
    test_y_truth = test_data(:,end) ;
    trees_num = 5 ;%total trees
    forest = cell(trees_num,1)  ;
    temp_y = train_data ;
    %train
    for j=1:trees_num
        forest{j} = createTree(temp_y,labels,0) ;
        predict_y = predict(forest{j},temp_y,labels) ;
        temp_y(:,end) = temp_y(:,end) - predict_y ;
    end

    %predict
    ans_y = zeros(test_data_len,1) ;
    for j=1:trees_num 
        ans_y = ans_y + predict(forest{j},test_data,labels) ;
    end
    %disp([test_y_truth ans_y]) ;
    ae = ae+sum(abs(ans_y-test_y_truth))/size(test_y_truth,1) ;
    count = sum(ans_y==test_y_truth) ;
    rr = rr+count/test_data_len ;
end
mae = ae / test_runtimes ;
mrr = rr / test_runtimes ;
disp('mae') ;
disp(mae) ;
disp('mrr') ;
disp(mrr) ;