function response = frequency_response(input,output,ffinal)
% Returns the output divided by input, and plots the result.
% This equals to the frequency response if the input signal is a linear chirp
% input: input signal
% output: output signal
% ffinal: final frequency of the chirp (assume initial = 20Hz)
response = amplitude_to_db(envelope_hilbert(output)./envelope_hilbert(input));

f=(20:(ffinal-20)/length(input):ffinal-(ffinal-20)/length(input));

plot(f,response);
ymax=max(20, max(response)+20);
ymin=min(20, min(response)-20);
ylim([ymin ymax]);
title('Frequency response');
ylabel('Gain (dB)');
xlabel('Frequency (Hz)');
grid on;
end

