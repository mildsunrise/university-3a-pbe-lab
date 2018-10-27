function envelope = envelope_rms_rect(signal, window_width)
%envelope_rms_rect RMS envelope of a signal, with a rectangular window

    window = ones(1, window_width) / window_width;
    power = abs(signal) .^ 2;
    envelope = sqrt(conv(power, window, "same"));
end
