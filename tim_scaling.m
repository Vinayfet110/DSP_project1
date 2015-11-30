% test time scaling
% 
im = imread('sq1.png');
if size(im,3)>1
    im = im2bw(im);
end
 
im1 = zeros(size(im));
xshift=60;
yshift=60;
 
im1(1+xshift:end,1+yshift:end)=im(1:end-xshift,1:end-yshift);
imFFT = fftshift(fft2(im));
imFFTM = abs(imFFT);   % magnitude
imFFTP = angle(imFFT);
 
im1FFT = fftshift(fft2(im1));
im1FFTM = abs(im1FFT);   % magnitude
im1FFTP = angle(im1FFT); % Phase
[M,N] = size(im);
u = 1:M;
v = 1:N;
 
for u=1:M
    for v=1:N
        tmp(u,v)=2*pi*(u*xshift/N + v*yshift/N);
    end
end
 
im1FFTP = im1FFTP + tmp;
 
% magnitude remains same ....Phase changes ...
 
subplot(231);
imshow(im);
subplot(232);
imshow(log(1+imFFTM),[]);
subplot(233);
imshow((imFFTP),[]);
 
subplot(234);
imshow(im1);
subplot(235);
imshow(log(1+im1FFTM),[]);
subplot(236);
imshow((im1FFTP),[]);

