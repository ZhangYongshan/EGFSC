function [W,Y] = AXBW(X, A,B, lambda)
%  Graph Convolutional Self-Representation
%   此处显示详细说明

% iter_num = 10; %20;

[nFea,nSmp] = size(X); 

Y =A'*X'*B';
Ib = eye(nSmp);

G = (Y*Y'+lambda*Ib)^(-1);
W = G*Y*X;


% %maxbw
% [n, d] = size(X);
% % scatter matrix S
% %S = xxb*xxb';
% Sp =B'*X'*A'*X;
% Y= B'*X'*A';
% Sq =Y*A*X*B;   %n x n
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
end
