function [ retDataset ] = splitDataset(dataset,axis,value,arg )
%axis �����ֵ��λ�� value��ʾ��ֵ ���ػ��ֺ��dataset,arg��ʾȡ���ڵĲ��֣�1Ϊ���ڣ�����С�ڵ��ڵĲ���
    if arg==1
        retDataset = dataset(dataset(:,axis)>value,:) ;
    else
        retDataset = dataset(dataset(:,axis)<=value,:) ;
    end
end

