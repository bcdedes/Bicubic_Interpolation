%% Compare implementation with MATLAB interp2 function

srcImg = eia_lr(:,:,1); % read image
[Xq,Yq] = meshgrid(1:0.125:90,1:0.125:90); % define scaling
destImgMATLAB = interp2(srcImg,Xq,Yq,'bicubic');
destImg = bicubicInterpolate(srcImg,8);

figure
subplot(121)
imshow(destImgMATLAB,[])
title('MATLAB Implementation')
subplot(122)
imshow(destImg,[])
title('Current Implementation')

diff = destImgMATLAB - destImg;
if sum(any(diff > 1e-10)) == 0
    disp("Matched MATLAB implementation")
end