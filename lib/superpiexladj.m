function [S] = superpiexladj(data2D,labels)
%   Roy_cubseg_Gen_adj 根据构建的超像素分割图构建权重矩阵
    %[m, n, p] = size(indian_pines_corrected);%行列宽
    %data_col = reshape(indian_pines_corrected,m*n,p);%重塑矩阵(行列展开)
    %Adj= zeros(m*n,m*n); %转换为8位无符号整数
   data_col=data2D;
   [m,~]=size(data_col);
 
    %统计所取区域的类别及分布
    %gt_col=reshape(labels,m*n,1);
    gt_col=labels;
    gt_cla=unique(gt_col);
    gt_num = length(gt_cla);
    %n = length(unique(x));
%     S_i=[];
%     S_j=[];
%     S_v=[];
    dist_seg=[];

    i_seg=[];
    j_seg=[];
for i=1:gt_num
   ci = length(find(gt_col==gt_cla(i)));   %求为i的个数 
   [v]=find(gt_col==gt_cla(i));   %存标签
   fprintf('正在处理分割区域; %d\n',i);
    datai = data_col(find(gt_col==gt_cla(i)),:); %datai为data_col里项目值为i依次存的数据
    options = [];
     options.k =7;
     temp=constructW(datai,options);
      dist_seg_temp=[];%存一个区域的dist
    for j=1:ci
    %算欧式距离 法1 直接存
    [dist_temp]=temp(j,:);
     dist_seg_temp=[dist_seg_temp,dist_temp];%权重向量
     i_seg_tmp=[];
     i_seg_tmp(1:ci)=v(j);
     i_seg=[i_seg i_seg_tmp];
     j_seg=[j_seg v'];
    end
 dist_seg=[dist_seg,dist_seg_temp];%权重向量
end
   S=sparse(i_seg,j_seg,dist_seg,m,m); 
    if  numel(find(isnan(S)))== 0 && sum((S==S')==0,'all')==0
        disp('邻接矩阵构建成功');
    else
        disp('邻接矩阵构建存在问题');
    end 
    %S1=full(S);
    %S=sparse(adj);
end
%%   i  j   v
% i
%S_i=zeros(m*n,k);
%for i_temp=1:m*n
%    S_i(i_temp,:)=i_temp;
%end
% j
%S_j=I_idx(:,2:k+1);

% % v
% S_v=B_date(:,2:k+1);
% 
%S=sparse(S_i,S_j,S_v,m*n,m*n);