function [Hz] = Plot_filter(ax, L,C,R,Fs,in)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
T=1/Fs;
f=logspace(0,15,100000);

w=2*pi*f/Fs;
z=exp(w*1j);
s=(2/T.*(1-z.^-1)./(1+z.^-1));
Hz=1./(1+s*(L/R)+(s.^2)*L*C);


semilogx(ax, f, 20*log10(abs(Hz)));
grid(ax,"on");
ylabel(ax,'dB');
axis(ax, [0 10e6 -100 20]);

%hold on;

%semilogx(ax, f, 20*log10(abs(fft(in,length(s)))));



end

