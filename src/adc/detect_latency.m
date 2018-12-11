function [latency, tsum, threshold, hist, bins, env] = detect_latency(signal)
    % get envelope
    env_width = 80;
    env = envelope_rms_rect(signal, env_width);

    % detect envelope step, and correct by filter width
    [latency, tsum, threshold, hist, bins] = detect_step(env);
    latency = min(round(latency + env_width / 4), length(env));
end
