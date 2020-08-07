%% convert raw to mat  3D
clc;
clear all;
imtool close all;
data_dir = './data/original.raw';
original_data = fopen(data_dir,'r');
original_data = fread(original_data,dim_x,dim_y,dim_z,'uint16');
original_data_mat = zeros(dim_y,dim_x,dim_z);
for z = 1:dim_z
    temp = original_data(dim_x*dim_y*(z-1)+1:dim_x*dim_y*z);
    temp  = reshape(temp,'uint16',[dim_x,dim_y]);
    original_data_mat(:,:,z) = temp';
end
save original_data_mat original_data_mat

