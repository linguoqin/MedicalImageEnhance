function [output] = RawRead(data_dir,dim_x,dim_y,data_type)
data_file = fopen(data_dir,'w');
data = fread(data_file,dim_x*dim_y,data_type);
output = reshape(data,[dim_x,dim_y]);
output = output';
end