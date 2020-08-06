%% 拉普拉斯金字塔  用来向上采样  预测残差
function pyramid=LaplacianPyramid(image, iternum)
    h_filter = [1, 4, 6, 4, 1]*(1/16);
    h_filter = h_filter' * h_filter;
    g_filter = h_filter * 4;
    
    pyramid = cell(iternum, 1);
    handle_image = image;
    
    for i = 1:iternum - 1
        temp = imfilter(handle_image, h_filter, 'replicate');  %高斯滤波
        rows = size(temp, 1);
        cols = size(temp, 2);
        temp = temp(1:2:rows, 1:2:cols, :);  %降采样
        origin_image = handle_image;
        handle_image = temp;
        temp = UpSampling(handle_image);  %上采样
        temp = temp(1:rows, 1:cols, :);
        temp = imfilter(temp, g_filter, 'replicate'); %高斯滤波----填充上采样图像的o元素
        e_handle_image = temp;
        pyramid{i} = origin_image - e_handle_image;  %边缘检测区域----拉普拉斯图像
    end
    pyramid{iternum} = handle_image;