function[acc,label] =  AXB2_single_ysk(data3D,label_gt,labelsA,para)

kVal = para.kVal;
num_PixelA =  para.numPixelA;
lambda = para.lambda;
ro = para.ro;
dim=10; alpha=20;

label_gt = double(label_gt);


[~,~,P]=size(data3D);


data = reshape(data3D, [], P);
data = mapminmax(data, 0, 1);
gnd = reshape(label_gt, [], 1);
nClass = length(unique(gnd)) - 1;
rand('twister', 3600);



[fea] = get_XM(data, labelsA);
[nSmp, nFea] = size(fea);
[A, B] = BA(fea, nSmp, nFea, kVal);
% 执行操作
W = AXB2(fea', A, B, lambda);
W = thrC(W, ro);
[C, L] = postProC(W, nClass, dim, alpha);
[label] = get_label(data, labelsA, C);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ind = find(gnd);
gnd_sub = gnd(ind);
label_sub = label(ind);
[acc, ~, ~, ~, ~, ~] = evaluate_results_clustering(label_sub, gnd_sub);



end