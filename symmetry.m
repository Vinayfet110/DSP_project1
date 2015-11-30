% symmetry property
% 2d Sinusoid
W=0:pi/30:2*pi;
H=0:pi/30:2*pi;
Tw=pi/6;
Th=pi/6;
A=1;
 
[w,h]=meshgrid(W,H);
 
S = A*sin(2*pi*w/Tw + 2*pi*h/Th );
subplot(231);
imshow(S),title('2D sinusoid');
subplot(232);
imshow(abs(fftshift(fft2(S))),[]),title('|F(w)|');
subplot(233);
imshow(abs(fftshift(fft2(-S))),[]),title('|F(-w)|');
subplot(234);
imshow(imag(fftshift(fft2(S))),[]),title('phi(w)');
subplot(235);
imshow(-imag(fftshift(fft2(-S))),[]),title('-phi(-w)');
 
