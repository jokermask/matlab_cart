function [ classVec ] = predict( tree , dataset , labels)
%tree应由createTree函数生成
    len = size(dataset,1) ;
    classVec = zeros(len,1) ;
    for i=1:len
        dataVec = dataset(i,1:end-1) ;
        tempnode = tree ;
        while(isstruct(tempnode))
            [~,tempFeatIdx] = ismember(tempnode.bestFeatLabel,labels) ;
            if(dataVec(tempFeatIdx)>tempnode.bestT)
                tempnode = tempnode.greaterthan ;
            else
                tempnode = tempnode.lessthan ;
            end
        end
        classVec(i) = tempnode ;
    end
end

