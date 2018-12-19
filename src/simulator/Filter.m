function [fc,out, num, den] = Filter(L,C,R,Fs,in)
%[s_out,Q,damp,fc] = Filter(in,L,C,R)
%   Inputs: R for resitence of the speaker, in for signal in, L for 
%   inductance, C for capacitance 

    T=1/Fs;
    fc=1/(2*pi*sqrt(L*C));
    
    %Defining bilinear parameters for the function "filter"
    %numerator
    b0 = R*T^2;
    b1 = 2*R*T^2;
    b2 = R*T^2;
    %denominator
    a0 = 4*C*L*R + 2*L*T + R*T^2;
    a1 = -8*C*L*R + 2*R*T^2;
    a2 = R*T^2 +4*R*C*L -2*L*T;

    num = [b0, b1, b2];
    den = [a0, a1, a2];

    out=filter(num,den,in);
    
%     [h1, f] = freqz(num,den,4096*100, Fs);
% 
%     figure(7); 
%     semilogx(f,20*log10(abs(h1))); hold on
%     grid on; ylim([-40,1]); ylabel('gain (db)'); xlim([.1, Fs/2]);
      

end

