% convolution and multiplication test
clc;clear;
im1=imread('circles.jpg');
im1=im2bw(im1);
% im1=im1(1:180,1:175);
 
im2 = imread('symbol.jpg');
im2=im2bw(im2);
% im2=im2(1:180,1:175);
im12conv = conv2(double(im1),double(im2));
im12convfft = fftshift(fft2(im12conv));
 
im12convfftLOG = log(1+abs(im12convfft));
 
 
M=size(im1,1)+size(im2,1);           % taking M and N 
N=size(im1,2)+size(im2,2);
 
im1fft = fftshift(fft2(im1,M,N));   % size adjustment.
im2fft = fftshift(fft2(im2,M,N));
 
im1fftLOG = log(1+abs(im1fft));
im2fftLOG = log(1+abs(im2fft));
 
 
im1fft_into_im2fft = im1fft .* im2fft;
 
im1fft_into_im2fftLOG=log(1+abs(im1fft_into_im2fft));
 
subplot(241);
imshow(im1,[]);title('Image A');
 
subplot(242);
imshow(im2,[]);title('Image B');
 
subplot(243);
imshow(im12conv,[]);title('Convolution A and B');
 
subplot(244);
imshow(im12convfftLOG,[]);title('FFT convolution (log transform)');
 
subplot(245);
imshow(im1fftLOG,[]);title('Image A FFT (log transform)');
 
subplot(246);
imshow(im2fftLOG,[]);title('Image B FFT (log transform)');
 
subplot(247);
imshow(im1fft_into_im2fftLOG,[]);title('F(A)*F(B) (log transform)');
 
subplot(248);
imshow(ifft2((ifftshift(((im1fft_into_im2fft))))),[]);title('ifft2');
