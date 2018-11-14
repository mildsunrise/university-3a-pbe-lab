function gain = gain(input,output,type)
% Returns the gain in dB of a system at the frequency given by the in signal.
% input: input signal
% output: output signal
% type: 0 for output in dB, 1 for linear
    x=sum(abs(input));
    y=sum(abs(output));
    if type==0
        gain=20*log10(y/x);
        fprintf('Gain = %f dB \n',gain)
    elseif type==1
        gain=y/x;
        fprintf('Gain = %f (linear) \n',gain)
    else 
        error('Type has to be 0 (for dB) or 1 (for linear)');
    end
end

