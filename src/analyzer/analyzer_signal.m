function signal = analyzer_signal(Fs, freq_points, freq_time)
%ANALYZER_SIGNAL Generates test signal for analyzer
    
    % test signal & padding
    
    sep = zeros(1, Fs*100e-3);

    silence_length = Fs*1;
    noise_length = Fs*1.5;

    latency_signal = [ zeros(1, silence_length), (rand(1, noise_length)*2-1) ];
    padding = zeros(1, noise_length);

    % useful signal: cosinus
    
    response = []
    freq_times = ones(1, length(freq_points)) * (freq_time / length(freq_points));
    for p = (1:length(freq_points))
        response = [ response sin(2*pi* freq_points(p) * (1:freq_times(p))/Fs) ];
    end
    
    % assemble
    signal = [ latency_signal sep response padding ];
    signal = [ signal; signal ]';

end

