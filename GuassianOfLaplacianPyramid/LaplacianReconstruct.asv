function image=LaplacianReconstruct(laplacian_pyramid,p,m)
    g_filter = [1, 4, 6, 4, 1]*(1/16);
    g_filter = g_filter' * g_filter * 4;
    
%     p = [0.45 0.55 0.65 0.87 0.88];
%     m = [1 1 1 1.08 1.08];
%     p = [0.65 0.65 0.75 0.87 0.88];
%     m = [1 1 1 1.08 1.08];
%     p = [0.55 0.65 0.75 0.87 0.88];
%     m = [1 1 1 1.08 1.08];
%     p = [0.45 0.45 0.65 0.67 0.68 0.77 0.78];
%     m = [1 1 1 1.08 1.08 1.1 1.1];
    laplacian_pyramid_copy = laplacian_pyramid;
    iternum = length(laplacian_pyramid_copy);
    for i = flip(2:iternum)
        temp = laplacian_pyramid_copy{i};
        temp = UpSampling(temp);
        rows = size(laplacian_pyramid_copy{i-1}, 1);
        cols = size(laplacian_pyramid_copy{i-1}, 2);
        temp = temp(1:rows, 1:cols);
        temp = imfilter(temp, g_filter, 'replicate');
        laplacian_pyramid_copy{i-1} = laplacian_pyramid_copy{i-1}/max(laplacian_pyramid{i-1}(:));
        laplacian_pyramid_copy{i-1}(laplacian_pyramid_copy{i-1}>=0) = laplacian_pyramid_copy{i-1}(laplacian_pyramid_copy{i-1}>=0).^p(i-1);
        laplacian_pyramid_copy{i-1}(laplacian_pyramid_copy{i-1}<0) = -(-laplacian_pyramid_copy{i-1}(laplacian_pyramid_copy{i-1}<0)).^p(i-1);
        
        laplacian_pyramid_copy{i-1} = laplacian_pyramid_copy{i-1}*max(laplacian_pyramid{i-1}(:))*m(i-1);
        laplacian_pyramid_copy{i-1} = laplacian_pyramid_copy{i-1} + temp;
    end
    
    image = laplacian_pyramid_copy{1};