clear;
clc;
addpath('./Method')
addpath(genpath('./lib'));
addpath('./data')
addpath('./common')
addpath('./Entropy Rate Superpixel Segmentation')


methods = {'AXBW', 'AXB2', 'AXB3'};
% methods = {'AXBW'}; datasets = {'Indian','PaviaU','Salinas'};
datasets = {'Indian'};

maxParams = [];
if ~exist('labels', 'dir')
    mkdir('labels');
end

for i = 1:length(datasets)
    for j = 1:length(methods)
        dataset = datasets{i};
        method = methods{j};

        [lambda, ro, numPixel, k] = set_optimal_parameters(dataset, method);
        para.lambda = lambda;
        para.numPixelA = numPixel;
        para.kVal = k;
        para.ro = ro;

        [data3D, label_gt] = load_dataset(dataset);

        start = tic;
        labelsA = cubseg(data3D, numPixel);
        switch method
            case 'AXBW'
                [acc, y_pred] = AXBW_single(data3D,label_gt,labelsA,para);
            case 'AXB2'
                [acc, y_pred] = AXB2_single(data3D,label_gt,labelsA,para);
            case 'AXB3'
                [acc, y_pred] = AXB3_single(data3D,label_gt,labelsA,para);
        end
        acc = sprintf('%.4f', acc);
        fprintf("dataset:%s,method:%s,acc:%s\n",dataset,method,acc);
        time = toc(start);

        if ~exist('./labels/', 'dir')
            mkdir('./labels/');
        end

        filename_mat = ['./labels/', dataset, '_', method, '_', acc, '.mat'];
        save(filename_mat, 'acc', 'time','y_pred','para');
    end
end