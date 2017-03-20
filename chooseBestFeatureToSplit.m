function [ bestFeat,bestT ] = chooseBestFeatureToSplit( dataset )
    [~,numFeats] = size(dataset) ;
    numFeats = numFeats-1 ;%除去标签那一列
    baseEnt = getEnt(dataset) ;
    baseInfoGain = 0 ;
    bestFeat = -1 ;
    for i=1:numFeats
        featVec = dataset(:,i) ;
        %由于值是连续的，所以对于特征向量组排序分成n段取中位数
        sortedFeatVec = sort(featVec,'ascend') ;
        lengthofT = floor(sqrt(length(sortedFeatVec))) ; %取向量长度开根号来确定阈值的个数
        if lengthofT<10
            lengthofT = length(sortedFeatVec) ;
            selectedFeat = sortedFeatVec ;
        else
            step = floor(length(sortedFeatVec)/lengthofT) ;
            selectedFeat = zeros(lengthofT,1) ;
            for j=1:lengthofT
                head = (j-1)*step+1 ;
                tail = j*step ;
                subSortedFeatVec = sortedFeatVec(head:tail) ;
                selectedFeat(j) = median(subSortedFeatVec) ;
            end
        end
        for k=1:lengthofT
            newEnt = 0 ;
            for l=1:2
                subDataset = splitDataset(dataset,i,selectedFeat(k),l) ;
                prob = size(subDataset,1)/size(dataset,1) ;
                newEnt = newEnt + prob*getEnt(subDataset) ;
            end
            infoGain = baseEnt - newEnt ;
%             disp('infoGain') ;
%             disp(infoGain) ;
            if(infoGain>baseInfoGain)
                baseInfoGain = infoGain ;
                bestFeat= i ;
                bestT = selectedFeat(k) ;
            end
        end
    end
end

