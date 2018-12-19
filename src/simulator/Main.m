%DEFINE PARAMETERS
%Global
Fs = 3*100e6; %sampling freq
Vdd=5; %vdd

%Test input
d=0.025;
t = 0:1/Fs:d;
%L=d*Fs;
f=10000;
%Triangle wave
A=1;
fw=5e6;
%Filter
L=22e-6;
C=470e-9;
R=8;
%==============================================
%DEFINE TEST SIGNAL

s=A*cos(2*pi*f*t);


%==============================================
%MAIN
tw = Triangle_wave(A,fw,d,Fs); %we create a triangle wave with the same duration of the signal and Fs

c = Comparator(s,tw); %Comparator Block - Out=1 if input>wave, else 0 

a=Ampl(c,Vdd); %Amplifies the signal to Vdd or -Vdd

[fc,out]=Filter(L,C,R,Fs,a);
%==============================================
%PLOTING SIGNALS
figure(1)
subplot(2,1,1);
plot(t,s,t,tw);
xlim([0 0.5/f]);
title('Input(Blue) TriangleWave(Orange)');
xlabel('t');

subplot(2,1,2); 
semilogx(abs(fft(s)));
%xlim([-0.5 ]);
title('Fft input');
xlabel('f');

figure (2)
subplot(2,1,1);
plot(t,c);
xlim([0 20/fw]);
title('Compared signal');
xlabel('t');

subplot(2,1,2); 
plot(abs(fft(c)));
%xlim([0 5/f]);
title('Fft Compared signal');
xlabel('f');

figure (3)
subplot(2,1,1);
plot(t,a);
xlim([0 20/fw]);
title('Compared and Amplified Signal');
xlabel('t');

subplot(2,1,2); 
plot(abs(fft(a)));
title('Fft Compared  and Amplified signal');
xlabel('f');

figure(5)
subplot(2,1,1);
plot(t,out,t,s);
xlim([10/f 15/f]);  
title('Input Signal (Orange) and Output (Blue)');
xlabel('t');

subplot(2,1,2); 
plot(t, abs(fft(out)), t,abs(fft(s)));
title('Fft Input and output');
xlabel('f');

Plot_filter(L,C,R,Fs,a);
