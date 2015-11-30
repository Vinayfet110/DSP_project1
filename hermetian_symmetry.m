% hermitian symmetry
clc;clear;
im=imread('ht.jpg');
im=im2bw(im);
 
imfft=(fft2(im));      % input image FFT F(w)
theta = angle(imfft);  % Phase
imMag = abs(imfft);    % input image magnitude
 
imfftneg = imMag.*exp(1i*-theta);   % F(-w)
imfftnegconj = conj(imfftneg);      % F*(-w)
 
LHS = imfft;
RHS = imfftnegconj;
 
subplot(321);
imshow(im);title('Orignal Image (I)');
 
subplot(322);
imshow(log(abs(imfft)+1),[]);title('(F(w))');
 
subplot(323);
imshow(log(abs(imfftneg)+1),[]);title('(F(-w))');
 
subplot(324);
imshow(abs(ifft2(imfftneg)),[]);title('ifft2(F(-w))');
 
subplot(325);
imshow(log(abs(imfftnegconj)+1),[]);title('(F*(-w))');
 
subplot(326);
imshow(abs(ifft2(RHS)),[]);title('ifft2(F*(-w))');
 
