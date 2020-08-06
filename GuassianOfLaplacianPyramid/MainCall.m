function [output] =  MainCall(p,m)

data_dir = './data/CTImage.dcm';
src_image = double(dicomread(data_dir));
src_image = src_image - 2267;
% src_image(src_image<-1000) = -1000;

%denoise
% kernel = fspecial('average',3);
% src_image = imfilter(src_image,kernel);

iternum = 4;

[rows,cols] = size(src_image);

%guassian pyramid 
image_guas_pyramid = GaussianPyramid(src_image,iternum);

%laplacian pyramid 
image_lap_pyramid = LaplacianPyramid(src_image,iternum);

%laplacian reconstruct 
rec_image = LaplacianReconstruct(image_lap_pyramid,p,m);
rec_image(rec_image<-1000) = -1000;
rec_image(rec_image>4000) = 4000;
output = rec_image;
end
