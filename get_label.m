function [label] = get_label(X,superlabel,C)
%GETXM �˴���ʾ�йش˺�����ժҪ
%  ��x���г����طָ���ÿ���������ڽ��о�ֵ�˲� �˴���ʾ��ϸ˵��
%label:�����ر�ǩ
    data_col=X;
    [n,p]=size(data_col);
    label = zeros(n,1);
    %ͳ����ȡ�������𼰷ֲ�
    gt_col=superlabel;
    gt_cla=unique(gt_col);
    gt_num = length(gt_cla);
 
for i=1:gt_num
          [indix]=find(gt_col==gt_cla(i));   %���ǩ
         label(indix,:) = C(i,:); %dataiΪdata_col����ĿֵΪi���δ������ 
end 
end


