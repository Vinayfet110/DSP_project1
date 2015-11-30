% Test rotational property..
im= imread('A.jpg');
imROT = imrotate(im,45);
 
imFFT = fftshift(fft2(im));
imFFTLOG = log(1+abs(imFFT));
 
imROTFFT = fftshift(fft2(imROT));
imROTFFTLOG = log(1+abs(imROTFFT));
 
subplot(221);
imshow(im);title('Orignal Image');
 
subplot(222);
imshow((imFFTLOG),[]);title('FFT Orignal Image'); % log transformed
 
subplot(223);
imshow(imROT);title('Rotated Image');
 
subplot(224);
imshow((imROTFFTLOG),[]);title('FFT Rotated Image');% log transformed
