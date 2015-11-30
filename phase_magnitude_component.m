clc;
clear;
im = imread('ht.jpg');
im=im2bw(im);
im_fft = (fft2(im));
%imshow(im_fft)
%fft_shift= fftshift(im_fft);
%imshow(fft_shift)
 
theta=(angle(im_fft));
 
im_fft_mag=abs(im_fft);
imMag= log(abs(ifft2(im_fft_mag*exp(1i*0)))+1); % =mag*exp(i*theta)
 
im_fft_phase = cos(theta)+1i*sin(theta);
imPhase = abs(ifft2(im_fft_phase));
 
cpmin=min(min(abs(imPhase)));
cpmax=max(max(abs(imPhase)));
 
imMag1 = abs(ifft2(im_fft_mag));
 
cmmin=min(min(imMag1));
cmmax=max(max(imMag1));
 
imA = abs(ifft2(im_fft_mag.*exp(1i*theta)));
 
subplot(221);
imshow(im);title('Orignal Image');
subplot(222);
imshow(imA);title('Reconstructed Image (from mag & phase)');
subplot(223);
imshow(imMag1,[cmmin cmmax]); title('Reconstructed from magnitude');
subplot(224);
imshow(imPhase,[cpmin cpmax]);title('Reconstructed from phase');
 
