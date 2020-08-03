%%高斯金字塔  用来向下采样
function pyramid=GaussianPyramid(image, iternum)
    gaussian_filter = [1, 4, 6, 4, 1]*(1/16);
    gaussian_filter = gaussian_filter' * gaussian_filter;
    
    pyramid = cell(iternum, 1);
    pyramid{1} = image;
    
    for i = 2 : iternum
        temp = imfilter(pyramid{i-1}, gaussian_filter, 'replicate');  %高斯滤波
        rows = size(temp, 1);
        cols = size(temp, 2);
        temp = temp(1:2:rows, 1:2:cols, :);  %降采样
        pyramid{i} = temp;
    end