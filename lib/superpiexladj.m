function [S] = superpiexladj(data2D,labels)
%   Roy_cubseg_Gen_adj ���ݹ����ĳ����طָ�ͼ����Ȩ�ؾ���
    %[m, n, p] = size(indian_pines_corrected);%���п�
    %data_col = reshape(indian_pines_corrected,m*n,p);%���ܾ���(����չ��)
    %Adj= zeros(m*n,m*n); %ת��Ϊ8λ�޷�������
   data_col=data2D;
   [m,~]=size(data_col);
 
    %ͳ����ȡ�������𼰷ֲ�
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
   ci = length(find(gt_col==gt_cla(i)));   %��Ϊi�ĸ��� 
   [v]=find(gt_col==gt_cla(i));   %���ǩ
   fprintf('���ڴ���ָ�����; %d\n',i);
    datai = data_col(find(gt_col==gt_cla(i)),:); %dataiΪdata_col����ĿֵΪi���δ������
    options = [];
     options.k =7;
     temp=constructW(datai,options);
      dist_seg_temp=[];%��һ�������dist
    for j=1:ci
    %��ŷʽ���� ��1 ֱ�Ӵ�
    [dist_temp]=temp(j,:);
     dist_seg_temp=[dist_seg_temp,dist_temp];%Ȩ������
     i_seg_tmp=[];
     i_seg_tmp(1:ci)=v(j);
     i_seg=[i_seg i_seg_tmp];
     j_seg=[j_seg v'];
    end
 dist_seg=[dist_seg,dist_seg_temp];%Ȩ������
end
   S=sparse(i_seg,j_seg,dist_seg,m,m); 
    if  numel(find(isnan(S)))== 0 && sum((S==S')==0,'all')==0
        disp('�ڽӾ��󹹽��ɹ�');
    else
        disp('�ڽӾ��󹹽���������');
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