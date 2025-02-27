function [Anchor] = get_XM(X,label)
%GETXM 此处显示有关此函数的摘要
%  对x进行超像素分割后对每个超像素内进行均值滤波 此处显示详细说明
%label:超像素标签
    data_col=X;
    [n,p]=size(data_col);

    %统计所取区域的类别及分布
    gt_col=label;
    gt_cla=unique(gt_col);
    gt_num = length(gt_cla);
    Anchor=zeros(gt_num,p);
 
for i=1:gt_num
          [indix]=find(gt_col==gt_cla(i));   %存标签
         datai = data_col(indix,:); %datai为data_col里项目值为i依次存的数据 
         [ni,mi]=size(datai);
         Anchor(i,:)=sum(datai,1)/ni;
end 

end


