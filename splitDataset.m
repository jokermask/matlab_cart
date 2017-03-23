function [ retDataset ] = splitDataset(dataset,axis,value,arg )
%axis 代表键值的位置 value表示阈值 返回划分后的dataset,arg表示取大于的部分（1为大于）还是小于等于的部分
    if arg==1
        retDataset = dataset(dataset(:,axis)>value,:) ;
    else
        retDataset = dataset(dataset(:,axis)<=value,:) ;
    end
end

