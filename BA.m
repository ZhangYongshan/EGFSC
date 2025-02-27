function [A_n,B_n] = BA(fea,nSmp,nfea,k)
%BA 此处显示有关此函数的摘要
%   此处显示详细说明
% options = [];
% options.NeighborMode = 'KNN';
% options.k =10;
%S=sparse(fea*fea');
options = [];
options.k =k;
S = constructW(fea,options);
A_bar = S + speye(nSmp);
d = sum(A_bar);
d_sqrt = 1.0./sqrt(d);
d_sqrt(d_sqrt == Inf) = 0;

DH = diag(d_sqrt);
DH = sparse(DH);
A_n = DH * sparse(A_bar) * DH;


SB = constructW(fea',options);
B_bar = SB + speye(nfea);
d1 = sum(B_bar);
d_sqrt1 = 1.0./sqrt(d1);
d_sqrt1(d_sqrt1 == Inf) = 0;

DHB = diag(d_sqrt1);
DHB = sparse(DHB);
B_n = DHB * sparse(B_bar) * DHB;
end

