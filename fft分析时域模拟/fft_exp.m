clear
clc
Adc = 2;              %直流分量幅度
A1 = 3;               %频率F1信号的幅度
A2 = 1.5;             %频率F2信号的幅度
F1 = 50;              %信号1频率(Hz)
F2 = 75;              %信号2频率(Hz)
Fs = 512;             %采样频率(Hz)
P1 = -30;             %信号1相位(度)
P2 = 90;              %信号相位(度)
N = 256;              %采样点数
t = 0:1/Fs:N/Fs;    %采样时刻

S=Adc+A1*cos(2*pi*F1*t+pi*P1/180)+A2*cos(2*pi*F2*t+pi*P2/180);
plot(S)
title('原始信号')

figure;
Y=fft(S,N);   %Y为一个复数
Ayy=abs(Y);   %幅度
plot(Ayy)

figure;
Ayy=Ayy/(N/2);   %换算成实际的幅度
Ayy(1)=Ayy(1)/2;
F=((1:N)-1)*Fs/N; %换算成实际的频率值
plot(F(1:N/2),Ayy(1:N/2));   %显示换算后的FFT模值结果
title('幅度-频率曲线图');

%Y=Y-mean(Y);
%Y(1:3)=0;
real_fft=real(Y);
imag_fft=imag(Y);
phase = atan2(real_fft,imag_fft);  %获取波形的相位
plot(phase)
title("相位图")
phase_unwarp=unwrap(phase,pi);     %对相位进行展开
win = hann(length(phase_unwarp));
phase_unwarp2=phase_unwarp.*win';  %乘以hanning窗 
phasefft_data=fft(phase_unwarp2);  %对展开的相位进行fft得到相位频率
phasefft_data_sq=abs(phasefft_data)
plot(phasefft_data_sq);

[data,index]=max(phasefft_data_sq);

Ayy = abs(Y)
plot(Ayy(1:N));
title("FFT模值")

figure;
Ayy=Ayy/(N/2);              %换算成实际的幅度
Ayy(1)=Ayy(1)/2;
F=([1:N]-1)*Fs/N;              %换算成实际的频率值
plot(F(1:N/2),Ayy(1:N/2));   %显示换算后的FFT模值结果
title('幅度-频率曲线图');

%https://blog.csdn.net/weixin_42402241/article/details/113628823


