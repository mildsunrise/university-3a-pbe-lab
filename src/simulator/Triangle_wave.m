function [out] = Triangle_wave(A,f,d,Fs) 
%[out_t,out_f] = Triangle_wave(A,f,d)
%   It generates a triangle wave with these paramenters:
%   A for amplitude, f for frequency, p for phase,d for duration
    Ts=1/Fs;
    x=0:Ts:d;
    out=-4*abs(mod(x*f,1)-0.5)+1;
    %plot(x,out);s
end

