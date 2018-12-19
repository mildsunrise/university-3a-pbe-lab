function [ values, originals, phase, gain, thd, base_amplitude ] = analyzer_signal_measure(in, bypass, Fs, freq_points, freq_time, harmonics)
%ANALYZER_SIGNAL_MEASURE Make measurements from analyzer input signal

    % Detect latency, split signal
    latency = detect_latency(in(1:(Fs*1 + Fs*1.5), 1)')
    % TODO: safety tests
    signal_start = round(latency + Fs*1.5 + Fs*.1);
    signal = in(signal_start:signal_start + freq_time - 1, :);
    
    % Analyze the actual signal!
    freq_times = ones(1, length(freq_points)) * (freq_time / length(freq_points));
    freq_times = cumsum([0 freq_times]);
    values = zeros(harmonics + 1, length(freq_points));
    originals = ones(1, length(freq_points));
    freq_times(51)
    for p = (1:length(freq_points))
        freq = freq_points(p);
        response = signal(freq_times(p)+1:freq_times(p+1), :); % FIXME: don't use length
        response = response(21:length(response)-20, :);
        fv = -1j*2*pi * freq * (0:length(response)-1)/Fs;
        if ~bypass
            originals(p) = 2 * sum(exp(fv) .* response(:, 2)') / length(response);
        end
        for h = (1:harmonics+1)
            values(h, p) = 2 * sum(exp(fv*h) .* response(:, 1)') / length(response);
        end
    end

    % Calculate phase
    phase = unwrap(angle(values(1, :) ./ originals));
    phase = phase / phase(length(phase));
    
    % Normalize ampitudes
    % FIXME: could do with respect to original, i.e. to subtract frequency response from ADC-DAC
    base_amplitude = abs(values(1, length(values)/2)); % FIXME: choose better
    gain = abs(base_amplitude / originals(length(values)/2));
    values = values / base_amplitude;
    
    % Calculate THD
    powers = abs(values).^2;
    powers_main = powers(1, :);
    powers_harmonics = sum(powers(2:harmonics+1));
    thd = powers_harmonics ./ powers_main;
end
