% modulation
clc;clear;
im =imread('ht.jpg');
im=im2bw(im);
 
im_fft=fft2(im);   % fft of image
 
w0=100;              % shift amounts
w1=1;
 
[M,N]=size(im);   % size of image
 
WN = exp(2*pi*1i/N); % WM and WN factors
WM = exp(2*pi*1i/M);
 
im_fft_shift = circshift(im_fft,[w0 w1]);  % shift fft
 
for m=0:M-1                      % multiply orignal image with WM and WN factors
    for n=0:N-1
        im_new(m+1,n+1) = im(m+1,n+1) .* WM.^(w0.*m).* WN.^(w1*n);
    end
end
 
subplot(231);
imshow(im);title('Orignal Image');
 
subplot(232);
imshow(log(abs(im_fft)+1),[]);title('FFT of Image (log transform)');
 
subplot(233);
imshow(log(abs(im_fft_shift)+1),[]);title('Shifted FFT (log transform)');
 
subplot(234);
imshow(abs(ifft2(im_fft_shift)),[]); title('ifft(im-fft-shift)');
 
subplot(235);
imshow(abs(im_new),[]);title('im*WM^w^0^m*WN^w^1^n ');
 
 
 
