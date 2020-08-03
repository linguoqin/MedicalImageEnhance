%% ������˹������  �������ϲ���  Ԥ��в�
function pyramid=LaplacianPyramid(image, iternum)
    h_filter = [1, 4, 6, 4, 1]*(1/16);
    h_filter = h_filter' * h_filter;
    g_filter = h_filter * 4;
    
    pyramid = cell(iternum, 1);
    handle_image = image;
    
    for i = 1:iternum - 1
        temp = imfilter(handle_image, h_filter, 'replicate');  %��˹�˲�
        rows = size(temp, 1);
        cols = size(temp, 2);
        temp = temp(1:2:rows, 1:2:cols, :);  %������
        origin_image = handle_image;
        handle_image = temp;
        temp = UpSampling(handle_image);  %�ϲ���
        temp = temp(1:rows, 1:cols, :);
        temp = imfilter(temp, g_filter, 'replicate'); %��˹�˲�----����ϲ���ͼ���oԪ��
        e_handle_image = temp;
        pyramid{i} = origin_image - e_handle_image;  %��Ե�������----������˹ͼ��
    end
    pyramid{iternum} = handle_image;