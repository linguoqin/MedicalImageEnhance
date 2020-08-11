function [output] = MainCall(low_freq_coef,high_freq_coef)
%% setting 
N = 5;
data_dir = './data/CTImage.dcm';

%% wavelet
src_data = DcmRead(data_dir);
[c,s] = wavedec2(src_data,N,'db4');  %wave coef
length_s = size(s,1);
c(1:s(1,1)*s(1,2)) = low_freq_coef * c(1:s(1,1)*s(1,2));
offset = s(1,1)*s(1,2)+1;
for i = 2:length_s-1
    c(offset:3*s(i,1)*s(i,2)) = high_freq_coef(i-1) * c(offset:3*s(i,1)*s(i,2));
    offset = offset+3*s(i,1)*s(i,2);
end
output = waverec2(c,s,'db4');


