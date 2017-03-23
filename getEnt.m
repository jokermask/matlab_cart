function [ ent ] = getEnt( data )
%index present the label
[datalen,~] = size(data) ;
labelsVec = data(:,end) ;
uniLabels = sort(unique(labelsVec)) ;
labelCountsMap = histc(labelsVec,uniLabels) ;%rings and redsidual error are all numbers
% disp('labelCountsMap') ;
% disp(labelCountsMap) ;
ent = 0 ;
    for i=1:length(labelCountsMap)
       prob = labelCountsMap(i)/datalen ;
       ent = ent - prob*log2(prob) ;
    end
end

