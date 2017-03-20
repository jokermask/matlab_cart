function [ bestFeat,bestT ] = chooseBestFeatureToSplit( dataset )
    [~,numFeats] = size(dataset) ;
    numFeats = numFeats-1 ;%��ȥ��ǩ��һ��
    baseEnt = getEnt(dataset) ;
    baseInfoGain = 0 ;
    bestFeat = -1 ;
    for i=1:numFeats
        featVec = dataset(:,i) ;
        %����ֵ�������ģ����Զ�����������������ֳ�n��ȡ��λ��
        sortedFeatVec = sort(featVec,'ascend') ;
        lengthofT = floor(sqrt(length(sortedFeatVec))) ; %ȡ�������ȿ�������ȷ����ֵ�ĸ���
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

