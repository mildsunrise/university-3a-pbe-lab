clear    
L=22e-6;
C=470e-9;
R=8;

fs=100000000;
T=1/fs;
f=logspace(0,15,100000);

w=2*pi*f/fs;
z=exp(w*j);
s=(2/T.*(1-z.^-1)./(1+z.^-1))
Hz=1./(1+s*(L/R)+(s.^2)*L*C);


figure(1)
semilogx(f,20*log10(abs(Hz)));
grid on
ylabel('dB')
axis([0 10e6 -100 20]);
% figure(2)
% semilogx(f,angle(Hz));
% grid onx
