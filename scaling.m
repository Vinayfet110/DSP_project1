% test Scaling property
im1 = imread('sq1.png');
im2 = imread('sq2.png');
 
im1FFT = fft2(im1);
im2FFT = fft2(im2);
 
im1FFTC = fftshift(im1FFT);
im2FFTC = fftshift(im2FFT);
 
im1FFTLOG = log(1+abs(im1FFTC)); % log transfrom of FFT data...
im2FFTLOG = log(1+abs(im2FFTC));
 
subplot(221);
imshow(im1);title('Small square')
subplot(222);
imshow(im2);title('Big square')
subplot(223);
imshow(im1FFTLOG,[]);title('FFT Small square')
subplot(224);
imshow(im2FFTLOG,[]);title('FFT big square')
