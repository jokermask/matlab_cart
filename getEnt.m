function [ ent ] = getEnt( data )
%index present the label
[datalen,~] = size(data) ;
maxLabel = max(data(:,end)) ;
labelCountsMap = zeros(maxLabel,1) ;%rings are all numbers
    for i=1:datalen
        label =  data(i,end) ;
        if labelCountsMap(label)~=0
            labelCountsMap(label) = labelCountsMap(label) + 1 ;
        else
            labelCountsMap(label) = 1 ; 
        end
    end
    ent = 0 ;
%     disp('labelMap') ;
%     disp(labelCountsMap) ;
    for i=1:maxLabel
        if labelCountsMap(i)~=0
            prob = labelCountsMap(i)/datalen ;
            ent = ent - prob*log2(prob) ;
        end
    end
end

