clear;
Fs=1000; %采样频率
n=0:1/Fs:1;
 
%产生含有噪声的序列
xn=cos(2*pi*40*n)+3*cos(2*pi*100*n)+randn(size(n));
 
nfft=1024;
cxn=xcorr(xn,'unbiased'); %计算序列的自相关函数
CXk=fft(cxn,nfft);
Pxx=abs(CXk);
index=0:round(nfft/2-1);
k=index*Fs/nfft;
plot_Pxx = 10*log10(Pxx(index+1));
plot(k, plot_Pxx);