# MedicalImageEnhance
This is a project about Medical Image Enhancement with Matlab.
9856687fc6a67e2658ded077b178cbb4c9e2376f
clc 
clear all
imtool close all
%% 分割真人数据，对骨头增强
%%参数配置
DimX = 620;
DimY = 620;
DimZ = 620;
Z =220;
TissueThr = 800; 
%打开三维数据，并保存其中一层为JosephyData_2D.mat
% JosephyCaseDir = "G:\MatlabPro\BD\BoneEnhance\data\JosephyCase0618.raw";
% JosephyFile = fopen(JosephyCaseDir,'r');
% JosephyData_1D = fread(JosephyFile,DimX*DimY*DimZ,'int16');
% fclose(JosephyFile);
% JosephyData_2D=reshape(JosephyData_1D(DimX*DimY*Z+1:DimX*DimY*(Z+1)),[DimX,DimY]);
% JosephyData_2D = JosephyData_2D';
% clear JosephyData_1D;
% imtool(JosephyData_2D,[]);
% save JosephyData_2D JosephyData_2D
%% 通过Mask对骨组织和软组织分别进行分割
load('JosephyData_2D.mat', 'JosephyData_2D');
JosephyData_2D(JosephyData_2D<-1000) = -1000;
B_Mask = (JosephyData_2D<TissueThr);
T_Mask = (JosephyData_2D>=TissueThr);
JoseBone = JosephyData_2D;
JoseTissue = JosephyData_2D;
JoseBone(B_Mask)=0;
JoseTissue(T_Mask) = 0;
imtool(JoseBone,[]);
% log变换增强
% e=2.7182818284590452353602874713526624977572;
% B_Max = max(JoseBone(:));%% 归一化
% B_Min = min(JoseBone(:));
% NormalizeBone = (JoseBone-B_Min)/(B_Max-B_Min);
% LogBone = log(1+e*NormalizeBone)/log(e);
% LB_Max = max(LogBone(:));
% LB_Min = min(LogBone(:));
% JoseBone = (B_Max-B_Min)*LogBone + B_Min;
% EnhanceCase = JoseTissue+JoseBone;
% imtool(EnhanceCase,[]);
% imtool(JosephyData_2D,[])
% Compare = zeros(DimY,DimX);
% Compare(:,1:DimX/2) = EnhanceCase(:,1:DimX/2);
% Compare(:,DimX/2+2:DimX) =JosephyData_2D(:,DimX/2+2:DimX);
% imtool(Compare,[]);
%% 伽马增强
% gamma = 0.9;
% B_Max = max(JoseBone(:));%% 归一化
% B_Min = min(JoseBone(:));
% NormalizeBone = (JoseBone-B_Min)/(B_Max-B_Min);
% GammaBone = NormalizeBone.^gamma;
% imtool(GammaBone);
% JoseBone = (B_Max-B_Min)*GammaBone + B_Min;
% EnhanceCase = JoseTissue+JoseBone;
% imtool(EnhanceCase,[]);
% imtool(JosephyData_2D,[])
%% 拉普拉斯增强算法
% B_Max = max(JoseBone(:));%% 归一化
% B_Min = min(JoseBone(:));
% NormalizeBone = (JoseBone-B_Min)/(B_Max-B_Min);
% kernal = fspecial('laplacian',0);
% EdgeBone = imfilter(NormalizeBone,kernal,'replicate');
% LapBone = NormalizeBone - EdgeBone;
% EnhanceCase =  (B_Max-B_Min)*LapBone + B_Min +JoseBone;
% imtool(EnhanceCase,[]);
%% 混合增强方法
%梯度变换
% I=dicomread('./data/CTImage.dcm');
% % I = JosephyData_2D;
% I = double(I) - 2267;
% I(I<-1000) = -1000;
% Jose_Max = max(I(:));
% Jose_Min = min(I(:));
% JosephyData_2D_Nor = (I-Jose_Min)/(Jose_Max-Jose_Min);
% [gx,gy] = imgradientxy(JosephyData_2D_Nor,'sobel');
% GradientImg =abs(gx)+abs(gy);
% %均值平滑滤波
% AveKernal = fspecial('average',[5 5]);
% AverageFilter = imfilter(GradientImg,AveKernal);
% %拉普拉斯变换
% LapKernal = fspecial('laplacian',0);
% LapImg = imfilter(JosephyData_2D_Nor,LapKernal);
% LapImg = JosephyData_2D_Nor-LapImg;
% % LapImg(LapImg<0) = 0;
% MulImg = LapImg.*GradientImg;
% AddImg = JosephyData_2D_Nor + MulImg;
% %巴特沃斯高通滤波
% OriginalImg = im2double(AddImg);
% [len,wid] = size(OriginalImg);
% D0 = 0.1*len;
% FFtImg = fft2(OriginalImg);
% FFtImg = fftshift(FFtImg);
% [M,N] = size(FFtImg);
% n1 = 2;
% m = fix(M/2);
% n = fix(N/2);
% a = 0.5;
% b =2;
% for i = 1:M
%     for j = 1:N
%         D = sqrt((i-m)^2+(j-n)^2);
%         h1 = 1/(1+(D0/D)^(2*n1));
%         h2 = a + b*h1;
%         BTImg(i,j) = h2*FFtImg(i,j);
%     end
% end
% DFFtImg = real(ifft2(ifftshift(BTImg)));
% DFFtImg = (DFFtImg - min(DFFtImg(:)))/(max(DFFtImg(:))-min(DFFtImg(:)));
% % DFFtImg(DFFtImg<0) = 0;
% % ReNorImg =  (DFFtImg - min(DFFtImg(:)))/(max(DFFtImg(:))-min(DFFtImg(:)));
% a = 1;
% b = 0;
% m = 1;
% n = 0;
% ReNorImg = DFFtImg;
% ReNorImg(b<DFFtImg<a) =(m-n) * (DFFtImg(b<DFFtImg<a)  - b)/(a-b)+m;
% ReNorImg(DFFtImg<=b) = n;
% ReNorImg(DFFtImg>a) = m;
% imtool(DFFtImg,[]);
% Enhance = 0.7*ReNorImg + 1*JosephyData_2D_Nor;
% Enhance = (Enhance - min(Enhance(:)))/(max(Enhance(:)) - min(Enhance(:)));
% imtool(Enhance,[]);
% imtool(JosephyData_2D_Nor,[]);
%% rayleigh直方图增强
I=dicomread('./data/CTImage.dcm');
%I = JosephyData_2D;
I = double(I) - 2267;
I(I<-1000) = -1000;
Jose_Max = max(I(:));
Jose_Min = min(I(:));
JosephyData_2D_Nor = (I-Jose_Min)/(Jose_Max-Jose_Min);
LapKernal = fspecial('laplacian',0);
Lap_Img = imfilter(JosephyData_2D_Nor,LapKernal);
LapImg = JosephyData_2D_Nor-Lap_Img;
LapImg(LapImg<0) = 0;
OriginalImg = 65535*(LapImg - min(LapImg(:)))/(max(LapImg(:)) - min(LapImg(:)));
%OriginalImg = LapImg;
PanIm =OriginalImg;
[DimY,DimX] = size(PanIm);
OriginalImg_12=PanIm;
B_Max = max(OriginalImg_12(:));
B_Min = min(OriginalImg_12(:));
%  瓦里安锐化+CLAHE  imtool(0.5*JosephyData_2D_Nor + 0.5*OriginalImg,[])
HistEqImg = adapthisteq(uint16(PanIm),'NumTiles',[4 4],'clipLimit',0.0005,'Nbins',65536,'Distribution','rayleigh'); 
JosephyData_2D_Nor = 65535*(I-Jose_Min)/(Jose_Max-Jose_Min);
imtool(HistEqImg,[]);
imtool(JosephyData_2D_Nor,[]);
FloatHis = double(HistEqImg);
BoneEnImg =(B_Max-B_Min)*( FloatHis-min(FloatHis(:)))/(max(FloatHis(:)) - min(FloatHis(:))); 
EnhanceCase = BoneEnImg + JoseTissue;
EnhanceCase = 0.8*EnhanceCase + 0.2*JosephyData_2D;
% EnhanceCase = FloatHis;
% EnImg = ((B_Max - B_Min)*(HistEqImg-min(HistEqImg(:))))/(max(HistEqImg(:)) - min(HistEqImg(:))) + B_Min;
%对比图
Compare = zeros(DimY,DimX);
Compare(:,1:DimX/2) = EnhanceCase(:,1:DimX/2);
Compare(:,DimX/2+2:DimX) =JosephyData_2D(:,DimX/2+2:DimX);
%% 中值平滑滤波加AHE
% 中值滤波----边缘复制
% KernalSize = 3;
%  I=dicomread('./data/CTImage.dcm');
% I = double(I) - 2267;
% I(I<-1000) = -1000;
% %  I = JosephyData_2D;
% Jose_Max = max(I(:));
% Jose_Min = min(I(:));
% JosephyData_2D_Nor = 65535 * (I-Jose_Min)/(Jose_Max-Jose_Min);
% MidImg = JosephyData_2D_Nor;
% for j = (KernalSize-1)/2+1:DimY-(KernalSize-1)/2
%     for i =  (KernalSize-1)/2+1:DimX-(KernalSize-1)/2
%         %取模板内的数据
%         Templates = JosephyData_2D_Nor(j- (KernalSize-1)/2:j+ (KernalSize-1)/2,i- (KernalSize-1)/2:i+ (KernalSize-1)/2);
%         mid_value = median(Templates(:));
%         MidImg(j,i) = mid_value;
%     end
% end
% AveKernal = fspecial('average',[3 3]);%均值滤波
% AverageFilter = imfilter(JosephyData_2D_Nor,AveKernal);
%  HistEqImg =adapthisteq(uint16(AverageFilter),'NumTiles',[5 5],'clipLimit',0.0000005,'Nbins',65536,'Distribution','rayleigh'); 
% imtool(HistEqImg,[]);
% imtool(JosephyData_2D_Nor,[]);
%% 形态学运算
% InputImg = BoneEnImg;
% se = strel('disk',1);
% ImgEro = imerode(InputImg,se);
% imtool(ImgEro,[]);
% ImgOpen = imopen(InputImg,se);
% imtool(ImgOpen,[]);
% ImgDilate = imdilate(InputImg,se);
% imtool(ImgDilate,[]);
% BoneEnImg = ImgOpen;

%% 非锐化掩蔽操作
% k = 0.4;
% kernal = fspecial('gaussian',[5 5],5);
% GuasIMg = imfilter(JoseBone,kernal);
% Mask = JoseBone - GuasIMg;
% EnhanceBone = k*JoseBone +(1-k) * Mask;
% EnhanceCase = EnhanceBone + JoseTissue;
% imtool(GuasIMg,[]);
% imtool(EnhanceCase,[]);
%% 高亮度提升滤波
% k = 0.4;
% kernal = fspecial('gaussian',[5 5],5);
% GuasIMg = imfilter(JoseBone,kernal);
% Mask = JoseBone - GuasIMg;
% EnhanceBone = JoseBone +k * Mask;
% EnhanceCase = EnhanceBone + JoseTissue;
% imtool(GuasIMg,[]);
% imtool(EnhanceCase,[]);
% imtool(JosephyData_2D,[]);
%% SSR 增强算法
% InputImg = JoseBone;
% se = strel('disk',5);
% ImgEro = imerode(InputImg,se);
% imtool(ImgEro,[]);
%% MSR增强算法

%% matalb自带锐化
% inputImg = JoseBone;
% SharpImg = imsharpen(inputImg,'Radius',2,'Amount',2);
% EnhanceCase = SharpImg + JoseTissue;
% figure(1);imshow(EnhanceCase,[]);
