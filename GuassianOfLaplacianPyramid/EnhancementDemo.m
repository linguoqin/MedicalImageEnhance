%%demo
clear all;
clc;
imtool close all;

data_dir = './data/Test.dcm';
src_image = double(dicomread(data_dir));

iternum = 5;

[rows,cols] = size(src_image);

%Laplacian pyramid
image_pyramid = LaplacianPyramid(src_image,iternum);

%Laplacian Reconstruct
rec_image = LaplacianReconstruct(image_pyramid);

imtool(rec_image,[]);