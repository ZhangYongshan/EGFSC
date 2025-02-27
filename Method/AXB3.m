function [W,A]= AXB3(X, A_n,B_n,lambda)
% Efficient Graph Convolutional Self-Representation
%   此处显示详细说明

% iter_num = 10; %20;
[nFea,nSmp] = size(X);
Y1 =X*A_n;
Y2=B_n*X;
A=Y1'.*Y2';
B=Y2.*Y1;
Ib = eye(nSmp);
G = (A*B+lambda*Ib)^(-1);
W= G*(Y1'.*Y2')*X;
end
% 
% [n, d] = size(X);
% % scatter matrix S
% %S = xxb*xxb';
% Y1 =X*B_n;
% Y2=A_n*X;
% A=Y1'.*Y2';
% B=Y2.*Y1;
% 
% % G = (A+B+C+lambda*Ib)^(-1);
% Sp =Y1'.*Y2'*X;
% Sq =A*B;   %n x n
% 
% % corruption vector
% q = ones(d, 1)*(1-noise);
% q(end) = 1;
% 
% % Q: (d+1)x(d+1)
% Q = Sq.*(q*q');
% Q(1:d+1:end)=q.*diag(Sq);
% 
% 
% % P: dx(d+1)
% P = Sp(1:end,:).*repmat(q', d, 1);
% 
% % final W = P*Q^-1, dx(d+1);
% reg = lambda*eye(d);
% reg(end,end) = 0;
% W =pinv(Q+reg)*P;
% %W = P/(Q+reg);
% sel_fea=((A_n*X).*(X*B_n))*W;
