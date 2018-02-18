% z = eia_lr(:,:,1);
%z = imread('res_chart3.tif');
z = im{1};
[x,y] = meshgrid(1:90,1:90);
[Xq,Yq] = meshgrid(1:0.25:90,1:0.25:90);
z1 = interp2(im{1},Xq,Yq,'bicubic');
z2 = interp2(im{2},Xq,Yq,'bicubic');
baris_res = bicubic_interpolation(z,4);

line1_bar = cubic_interpolation(z(1,:),4);
line1_matlab = z1(1,:);

figure
subplot(121)
imshow(z1,[])
subplot(122)
imshow(baris_res,[])
diff = z1 - baris_res;

X1 = fft2(im{1}, 90, 90);
X2 = fft2(im{2}, 90, 90);
X1phase=angle(X1);
X2phase=angle(X2);
X1mag=abs(X1);
X2mag=abs(X2);

% Check if phase of input image equals generated image phase
phaseDiff = X1phase.*conj(X2phase)/(X1mag*X2mag);
shifts = real(ifft2(phaseDiff,90,90));