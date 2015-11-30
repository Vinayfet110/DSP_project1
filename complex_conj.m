% complex congugate
  
% complex congugate
clc;clear;
im= imread('ht.jpg');
im=im2bw(im);
 
M=size(im,1);
N=size(im,2);
imFFT=(fftshift(fft2(im)));
% imFFT for negative frequencies is conjugate(F(w))
% imFFTneg=conj(imFFT);
imFFTneg=conj(imFFT); % F(-w)
 
subplot(231);
imshow(im);title('Orignal Image');
 
subplot(232);
LHS=conj(double(im));
imshow(LHS,[]);title('conj(im)');
 
subplot(233);
imshow(log(abs(imFFTneg)+1),[]);title('F(-w)');
 
 
subplot(234);
imshow(abs(ifft2(ifftshift(imFFTneg))),[]);title('ifft2(F(-w))');
 
subplot(235);
imshow(log(abs(conj(imFFTneg))+1),[]);title('F*(-w)');
 
subplot(236);
RHS = real(ifft2(ifftshift(conj(imFFTneg))));
imshow((RHS),[]);title('ifft2(F*(-w))');
