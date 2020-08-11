function [output] = DcmRead(data_dir)
output = dicomread(data_dir);
end