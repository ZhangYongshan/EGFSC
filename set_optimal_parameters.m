function [lambdaCandi, roCandi, num_PixelA, k] = set_optimal_parameters(dataset, method)
% setParameters This function sets the parameters based on the method and dataset. 
%

% Setting optimal parameters for different datasets.
lambdaCandi = [];
roCandi = [];
num_PixelA = 0;
k = 0;

% dataset method num_pixel k ro lambda
params = {
    'Indian', 'AXBW', 30	5	0.8	0.01;
    'Salinas', 'AXBW', 25	7	0.2	1;
    'PaviaU', 'AXBW', 30, 7, 0.9,0.01;
    'WHU_Hi_HongHu', 'AXBW', 80	5	1	0.1;
    'Indian', 'AXB2', 40	9	0.4	10;
    'Salinas', 'AXB2', 25	7	0.6	1000;
    'PaviaU', 'AXB2', 30,7,0.8,1;
    'WHU_Hi_HongHu', 'AXB2', 40	9	0.1	1;
    'Indian', 'AXB3', 40	9	0.9	100;
    'Salinas', 'AXB3', 40	10	0.7	0.01;
    'PaviaU', 'AXB3', 30	15	0.2	1000;
    'WHU_Hi_HongHu', 'AXB3', 80	3	1	1;
    };


for i = 1:size(params, 1)
    if strcmp(dataset, params{i, 1}) && strcmp(method, params{i, 2})
        num_PixelA = params{i, 3};
        k = params{i, 4};
        roCandi = params{i, 5};
        lambdaCandi = params{i, 6};
        break; % Exit the loop once the matching parameters are set
    end
end

fprintf('lambdaCandi: %.2f\n', lambdaCandi);
fprintf('roCandi: %.2f\n', roCandi);
fprintf('num_PixelA: %d\n', num_PixelA);
fprintf('k: %d\n', k);
end
