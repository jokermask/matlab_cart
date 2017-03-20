function [ tree ] = createTree( dataset,labels,heightcount )
    len = size(dataset,1) ;
    templabel = dataset(1,end) ;
    tree = templabel ;
    max_depth = 5 ;
    flag = 1 ; %�ж��Ƿ����ݼ������б�ǩ��һ���ˣ����ģ������򷵻�
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
        disp(labelVec) ;
        element = 1:max(labelVec) ;% ��ʱdatasetֻ��һ��
        counts = histc(labelVec,element) ;
        [~,max_idx] = max(counts) ;
        tree = element(max_idx) ;
        return ;
    end
    [bestFeat,bestT] = chooseBestFeatureToSplit(dataset) ;
    bestFeatLabel = labels{bestFeat} ;
    tree = struct ;%struct�������ṹ
    tree.bestFeatLabel = bestFeatLabel ;
    tree.bestT = bestT ;
    tree.greaterthan = createTree(splitDataset(dataset,bestFeat,bestT,1),labels,heightcount+1) ;%������ֵ���ֵ�����
    tree.lessthan = createTree(splitDataset(dataset,bestFeat,bestT,2),labels,heightcount+1) ;%С����ֵ���ֵ�����
end

