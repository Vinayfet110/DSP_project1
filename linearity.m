%Linearity Test
clc;
clear
 
% FFT[a*im1(n) + b*im2(n)] = a*FFT[im1(n)] + b*FFT[im2(n)]
im1=imread('ht.jpg');
imA=im2bw(im1);
% imA=im1(1:140,1:140);   % taking fixed size o f image
 
im2=imread('vt.jpg');
imB=im2bw(im2);
% imB=im2(1:140,1:140);
 
 
a=0.5;
b=0.5;
 
LHS = fftshift(fft2(a*imA + b*imB));   % RHS of equation
 
x1_dft = fftshift(fft2(imA));
x2_dft = fftshift(fft2(imB));
 
RHS = a*x1_dft + b*x2_dft;            % LHS of equation
 
linearity_chk = mse(RHS,LHS)
 
subplot(231);
imshow(imA);title('Image A');
subplot(232);
imshow(imB);title('Image B');
subplot(233);
imshow(log(1+abs(LHS)),[]);title('LHS (DFT(a*x1 + b*x2))'); % log transformed fft data
subplot(234);
imshow(log(1+abs(RHS)),[]);title('RHS (a*DFT(x1) + b*DFT(x2))');
subplot(235);
imshow(abs(fft2(ifftshift(LHS))),[]);title('Reconstructed Image from LHS');
 
subplot(236);
imshow(abs(fft2(ifftshift(RHS))),[]);title('Reconstructed Image from RHS');


