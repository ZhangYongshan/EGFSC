function grp= CP(C,K,d,alpha)
if(nargin<4)
	alpha = 4;
end
if(nargin<3)
	d = 4;
end
N = length(C);

 C = (C + C')/2;
r = d*K+1;
opts.u0 = ones(N,1);
[U,S,~] = svds(C,r,'largest',opts);
S = diag(S);
U = U*diag(sqrt(S));
U = normr(U);
Z = U*U';
L = Z.^alpha;

% ncut
L = (abs(L) + abs(L'))/2;
grp=spectralcluster(L,K,'Distance','precomputed');
% grp = ncutW(L,K); % get your ncutW funtion via http://www.cis.upenn.edu/~jshi/software/

end