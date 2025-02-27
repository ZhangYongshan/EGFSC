function [data3D, label_gt] = load_dataset(dataset)
    % 根据输入的 dataset 名称加载相应的数据集和标签
    if strcmp(dataset, 'Indian')
        load Indian_pines_corrected;
        load Indian_pines_gt;
        data3D = indian_pines_corrected;
        label_gt = indian_pines_gt;
    elseif strcmp(dataset, 'PaviaU')
        load PaviaU;
        load PaviaU_gt;
        data3D = paviaU;
        label_gt = paviaU_gt;
    elseif strcmp(dataset, 'Salinas')
        load Salinas_corrected;
        load Salinas_gt;
        data3D = salinas_corrected;
        label_gt = salinas_gt;
    elseif strcmp(dataset, 'WHU_Hi_HongHu')
        load WHU_Hi_HongHu;
        load WHU_Hi_HongHu_gt;
        data3D = WHU_Hi_HongHu;
        label_gt = WHU_Hi_HongHu_gt;
    else
        error('Unknown dataset: %s', dataset);
    end
    
    % 将 data3D 转换为 double 类型
    data3D = double(data3D);
end