% Duality TEST
im = imread('ht.jpg');
im=im2bw(im);
imFFT = fft2(im);   % FFT
 
imFFT2= fft2(imFFT);     % dual FFT
 
imFFTLOG = log(1+abs(imFFT));  % log transform
imFFT2LOG = log(1+abs(imFFT2)); % ''
 
subplot(131);
imshow(im);title('Orignal Image');
subplot(132);
imshow(imFFTLOG,[]);title('FFT');
subplot(133);
imshow(imFFT2LOG,[]); title('FFT(FFT)');

