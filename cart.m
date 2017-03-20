dataset = importdata('abalone.data.txt') ;
data = dataset.data ;
labels = {'Length';'Diam';'Height';	'Whole';'Shucked';'Viscera';'Shell';'Rings'} ;
% features = data(:,1:end-1) ;
% y = data(:,end) ;
len = floor(length(data)/4*1) ;
train_data = data(1:len,:) ;%训练集
test_data = data(len:end,:) ;%测试集
y = test_data(:,end) ;%测试集真值
tree = createTree(train_data,labels,0) ;
predict_y = predict(tree,test_data,labels) ;
res = [predict_y,y] ;
count = sum(predict_y==y) ;
x = 1:1:size(y,1) ;
plot(x,predict_y,'-b',x,y,'-r') ;
mae = sum(abs(predict_y-y))/size(y,1) ;
rr = count/size(y,1) ;
% std_tree = fitctree(train_data(:,1:7),train_data(:,end)) ;
% view(std_tree) ;
% std_y = predict(std_tree,test_data(:,1:7)) ;
%L = loss(std_tree,test_data(:,1:7),y) ;
disp(res) ;
disp(mae) ;
disp(rr) ;
% disp([std_y,y]) ;
% std_mae = sum(abs(std_y-y))/size(y,1) ;
% disp(std_mae) ;
% std_rr = sum(std_y==y)/size(y,1) ;
% disp(std_rr);

