function [Anchor] = get_XM(X,label)
%GETXM �˴���ʾ�йش˺�����ժҪ
%  ��x���г����طָ���ÿ���������ڽ��о�ֵ�˲� �˴���ʾ��ϸ˵��
%label:�����ر�ǩ
    data_col=X;
    [n,p]=size(data_col);

    %ͳ����ȡ�������𼰷ֲ�
    gt_col=label;
    gt_cla=unique(gt_col);
    gt_num = length(gt_cla);
    Anchor=zeros(gt_num,p);
 
for i=1:gt_num
          [indix]=find(gt_col==gt_cla(i));   %���ǩ
         datai = data_col(indix,:); %dataiΪdata_col����ĿֵΪi���δ������ 
         [ni,mi]=size(datai);
         Anchor(i,:)=sum(datai,1)/ni;
end 

end


