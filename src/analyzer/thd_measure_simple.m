function [THD,frequency_sent] = thd_measure_simple(signal_received,fs,graph)
% Returns the THD in % of the system, using a system output signals.
% signal_received: signal output of the system.
% frequency_sent: center frequency of the tone.
% fs: sampling frequency
% graph: 1 if you want a plot of the fft of the signal. 
pot_harmonics=0;
xf=fft(signal_received,fs);                      
xff=xf.*conj(xf);

[~,frequency_sent]=max(abs(xf));
frequency_sent=frequency_sent-1;
L=floor(0.5*fs/frequency_sent);
j=0;
for i = 1:L                        %mirem els harmonics     
%     for j=-1:1
        pot_harmonics=pot_harmonics+abs(xff(frequency_sent*(1+i)+j+1));
%     end
end
pot_harmonics=2*pot_harmonics/fs;       
%     for j=-1:1
pot_total=2*abs(xff(frequency_sent+j+1))/fs;
%     end
THD=sqrt(pot_harmonics)/sqrt(pot_total)*100;     %i calculem el THD
if graph==1
    figure;
    plot(abs(xf));
    title('FFT of the received signal');
    xlabel('Frequency (Hz)');
end
fprintf('THD = %.3f %% \n',THD);
end