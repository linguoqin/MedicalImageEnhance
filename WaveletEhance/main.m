clc;
clear all;
imtool close all;
%wavelet to enhance dental
%% setting 
dim_x = 620;
dim_y = 620;
N = 5;
data_dir = './data/CTImage.dcm';
low_freq_coef = 2;
high_freq_coef = [1 1 1 1 1];

%% wavelet
src_data = DcmRead(data_dir);
[c,s] = wavedec2(src_data,N,'db4');  %wave coef
length_c = size(c,2);
length_s = size(s,1);
c(1:s(1,1)*s(1,2)) = low_freq_coef * c(1:s(1,1)*s(1,2));
offset = s(1,1)*s(1,2)+1;
for i = 2:length_s-1
    c(offset:3*s(i,1)*s(i,2)) = high_freq_coef(i-1) * c(offset:3*s(i,1)*s(i,2));
    offset = offset+3*s(i,1)*s(i,2);
end
recon_img = waverec2(c,s,'db4');
imtool(recon_img,[]);

