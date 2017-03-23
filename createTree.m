function [ tree ] = createTree( dataset,labels,heightcount )
%todo 建树会出现空节点
    len = size(dataset,1) ;
    templabel = dataset(1,end) ;
    tree = templabel ;
    max_depth = 5 ;%最大树高
    flag = 1 ; %判断是否数据集中所有标签都一致了（纯的），是则返回
    for i=1:len
        if templabel~=dataset(i,end) ;
            flag = 0 ;
        end
    end
    if flag==1
        return ;
    end
    if heightcount>max_depth
        labelVec = dataset(:,end) ;
        %disp(labelVec) ;
        element = sort(unique(labelVec)) ;
        counts = histc(labelVec,element) ;
        [~,max_idx] = max(counts) ;
        tree = element(max_idx) ;
        return ;
    end
    [bestFeat,bestT] = chooseBestFeatureToSplit(dataset) ;
    bestFeatLabel = labels{bestFeat} ;
    tree = struct ;%struct储存树结构
    tree.bestFeatLabel = bestFeatLabel ;
    tree.bestT = bestT ;
    tree.greaterthan = createTree(splitDataset(dataset,bestFeat,bestT,1),labels,heightcount+1) ;%大于阈值部分的子树
    tree.lessthan = createTree(splitDataset(dataset,bestFeat,bestT,2),labels,heightcount+1) ;%小于阈值部分的子树
end

